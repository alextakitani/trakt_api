module TraktApi


  class Calendar
    attr_accessor :episodes


    def initialize(user_id:nil,api_key:nil,token:nil,date:Date.today-7,days:7)


      @user_id, @api_key, @date, @days, @token = user_id,api_key,date,days,token


      @conn = Faraday.new(:url => "https://api.trakt.tv") do |c|
        c.request :json
        c.response :json, :content_type => /\bjson$/
        c.use :instrumentation
        c.adapter Faraday.default_adapter
      end

      res = @conn.get do |req|
        req.url "/calendars/shows/#{@date}/#{@days}"
        req.headers['trakt-api-version'] = '2'
        req.headers['trakt-api-key'] = @api_key
        req.headers['trakt-user-login'] = @user_id
        req.headers['trakt-user-token'] = @token
      end
      self.episodes = process_calendar_response(res.body) if res.status == 200

    end

    def process_calendar_response(response)
      eps = []
      response.each do |date|

        date[1].each do |ep|

          res = @conn.get do |req|
            req.url "/shows/#{ep["show"]["ids"]["trakt"]}?extended=full"
            req.headers['trakt-api-version'] = '2'
            req.headers['trakt-api-key'] = @api_key
            req.headers['trakt-user-login'] = @user_id
            req.headers['trakt-user-token'] = @token
          end.body.merge(
          @conn.get do |req|
            req.url "/shows/#{ep["show"]["ids"]["trakt"]}?extended=images"
            req.headers['trakt-api-version'] = '2'
            req.headers['trakt-api-key'] = @api_key
            req.headers['trakt-user-login'] = @user_id
            req.headers['trakt-user-token'] = @token
          end.body)


         show = TraktApi::Show.new(res)

         eps << TraktApi::Episode.new(ep["episode"].merge({"airs_at" => ep["airs_at"]}).merge({show:show}) )
        end
      end
      eps
    end

  end

end