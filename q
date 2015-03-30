
[1mFrom:[0m /home/alex/Pessoais/trakt_api/lib/trakt_api/calendar.rb @ line 28 TraktApi::Calendar#initialize:

     [1;34m8[0m: [32mdef[0m [1;34minitialize[0m([35muser_id[0m:[1;36mnil[0m,[35mapi_key[0m:[1;36mnil[0m,[35mtoken[0m:[1;36mnil[0m,[35mdate[0m:[1;34;4mDate[0m.today-[1;34m7[0m,[35mdays[0m:[1;34m7[0m)
     [1;34m9[0m: 
    [1;34m10[0m: 
    [1;34m11[0m:   @user_id, @api_key, @date, @days, @token = user_id,api_key,date,days,token
    [1;34m12[0m: 
    [1;34m13[0m: 
    [1;34m14[0m:   @conn = [1;34;4mFaraday[0m.new([33m:url[0m => [31m[1;31m"[0m[31mhttps://api.trakt.tv[1;31m"[0m[31m[0m) [32mdo[0m |c|
    [1;34m15[0m:     c.request [33m:json[0m
    [1;34m16[0m:     c.response [33m:json[0m, [33m:content_type[0m => [35m[1;35m/[0m[35m[1;35m\b[0m[35mjson$[1;35m/[0m[35m[0m
    [1;34m17[0m:     c.use [33m:instrumentation[0m
    [1;34m18[0m:     c.adapter [1;34;4mFaraday[0m.default_adapter
    [1;34m19[0m:   [32mend[0m
    [1;34m20[0m: 
    [1;34m21[0m:   res = @conn.get [32mdo[0m |req|
    [1;34m22[0m:     req.url [31m[1;31m"[0m[31m/calendars/shows/#{@date}[0m[31m/#{@days}[0m[31m[1;31m"[0m[31m[0m
    [1;34m23[0m:     req.headers[[31m[1;31m'[0m[31mtrakt-api-version[1;31m'[0m[31m[0m] = [31m[1;31m'[0m[31m2[1;31m'[0m[31m[0m
    [1;34m24[0m:     req.headers[[31m[1;31m'[0m[31mtrakt-api-key[1;31m'[0m[31m[0m] = @api_key
    [1;34m25[0m:     req.headers[[31m[1;31m'[0m[31mtrakt-user-login[1;31m'[0m[31m[0m] = @user_id
    [1;34m26[0m:     req.headers[[31m[1;31m'[0m[31mtrakt-user-token[1;31m'[0m[31m[0m] = @token
    [1;34m27[0m:   [32mend[0m
 => [1;34m28[0m:   binding.pry
    [1;34m29[0m: 
    [1;34m30[0m:   [1;36mself[0m.episodes = process_calendar_response(res.body) [32mif[0m res.status == [1;34m200[0m
    [1;34m31[0m: 
    [1;34m32[0m: [32mend[0m

