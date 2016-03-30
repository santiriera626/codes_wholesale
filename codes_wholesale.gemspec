# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codes_wholesale/version'

Gem::Specification.new do |spec|
  spec.name          = "codes_wholesale"
  spec.version       = CodesWholesale::VERSION
  spec.authors       = ["Terence Ponce"]
  spec.email         = ["terenceponce@gmail.com"]

  spec.summary       = %q{A Ruby interface the CodesWholesale API}
  spec.description   = %q{A Ruby interface the CodesWholesale API}
  spec.homepage      = "https://github.com/terenceponce/codes_wholesale"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr", "3.0.1"
  spec.add_development_dependency "webmock", "1.24.2"
  spec.add_development_dependency "byebug"

  spec.add_dependency "faraday", "0.9.2"
  spec.add_dependency "sawyer", "0.7.0"
  spec.add_dependency "oauth2", "1.1.0"
  spec.add_dependency "json", "1.8.3"
end
