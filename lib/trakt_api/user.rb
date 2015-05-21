module TraktApi

  class User
    attr_accessor :calendar

    def initialize(user_id:nil, password:nil, api_key:nil, api_secret:nil)
      @user_id, @api_key = user_id,api_key

      @conn = Faraday.new(:url => "api-v2launch.trakt.tv") do |c|
        c.request :json
        c.response :json, :content_type => /\bjson$/
        c.use :instrumentation
        c.adapter Faraday.default_adapter
      end

      res = @conn.post do |req|
        req.url '/auth/login'
        req.headers['trakt-api-version'] = '2'
        req.headers['trakt-api-key'] = api_key
        req.body = '{ "login": "' + user_id + '" , "password" : "' + password + '"}'
      end

      @token = res.body["token"]

      @calendar = TraktApi::Calendar.new(user_id:@user_id,api_key:@api_key,token:@token)

    end

    def watched_shows
      res = @conn.get do |req|
        req.url "/users/#{@user_id}/watched/shows"
        req.headers['trakt-api-version'] = '2'
        req.headers['trakt-api-key'] = @api_key
        req.headers['trakt-user-login'] = @user_id
        req.headers['trakt-user-token'] = @token
      end

      res.body.map{|show| TraktApi::Show.new(show) } || []
    end

    def watched_movies
      res = @conn.get do |req|
        req.url "/users/#{@user_id}/watched/movies"
        req.headers['trakt-api-version'] = '2'
        req.headers['trakt-api-key'] = @api_key
        req.headers['trakt-user-login'] = @user_id
        req.headers['trakt-user-token'] = @token
      end
      res.body.map{|m| TraktApi::Movie.new(m) } || []
    end

    def unwatched_movies
      res = @conn.get do |req|
        req.url "/users/#{@user_id}/watchlist/movies"
        req.headers['trakt-api-version'] = '2'
        req.headers['trakt-api-key'] = @api_key
        req.headers['trakt-user-login'] = @user_id
        req.headers['trakt-user-token'] = @token
      end

      res.body.map do |m|
        res = @conn.get do |req|
            req.url "/movies/#{m["movie"]["ids"]["trakt"]}?extended=full"
            req.headers['trakt-api-version'] = '2'
            req.headers['trakt-api-key'] = @api_key
            req.headers['trakt-user-login'] = @user_id
            req.headers['trakt-user-token'] = @token
          end.body.merge(
          @conn.get do |req|
            req.url "/movies/#{m["movie"]["ids"]["trakt"]}?extended=images"
            req.headers['trakt-api-version'] = '2'
            req.headers['trakt-api-key'] = @api_key
            req.headers['trakt-user-login'] = @user_id
            req.headers['trakt-user-token'] = @token
          end.body)

        TraktApi::Movie.new(res)
      end || []
    end

  end

end