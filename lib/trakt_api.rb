require 'hashie'
require 'trakt_api/version'
require 'trakt_api/user'
require 'trakt_api/calendar'
require 'trakt_api/episode'
require 'trakt_api/show'
require 'trakt_api/movie'
require 'faraday'
require 'faraday_middleware'
require 'simple_oauth'
require 'date'
require 'multi_json'
require 'pp'
require 'dotenv'
Dotenv.load

begin
  require 'pry'
rescue LoadError
end

module TraktApi

end

