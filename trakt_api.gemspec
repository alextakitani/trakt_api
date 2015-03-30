# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trakt_api/version'

Gem::Specification.new do |spec|
  spec.name          = "trakt_api"
  spec.version       = TraktApi::VERSION
  spec.authors       = ["Alex Takitani"]
  spec.email         = ["aftakitani@gmail.com"]
  spec.description   = %q{Trakt Api}
  spec.summary       = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency "pry-nav"
  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_runtime_dependency "simple_oauth"
  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency "oj"
  spec.add_runtime_dependency "hashie"

end


