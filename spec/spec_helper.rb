require 'rubygems'
require 'bundler/setup'
require 'trakt_api'
# require 'vcr'
# require 'webmock'

# VCR.configure do |c|
#   c.cassette_library_dir     = 'spec/cassettes'
#   c.hook_into                :webmock
#   c.default_cassette_options = { :record => :new_episodes }
#   c.configure_rspec_metadata!
#   #c.debug_logger = $stdout
# end

RSpec.configure do |c|
  #c.extend VCR::RSpec::Macros
  c.treat_symbols_as_metadata_keys_with_true_values = true
end