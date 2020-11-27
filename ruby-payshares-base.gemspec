# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payshares/base/version'

Gem::Specification.new do |spec|
  spec.name          = "payshares-base"
  spec.version       = Payshares::Base::VERSION
  spec.authors       = ["Kedia"]
  spec.email         = ["support@payshares.org"]
  spec.summary       = %q{Payshares client library: XDR}
  spec.homepage      = "https://github.com/payshares/ruby-payshares-base"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["generated", "lib"]

  spec.add_dependency "payshares-xdr"
  spec.add_dependency "rbnacl", "3.1.2"
  spec.add_dependency "activesupport", "4.1.9"

  # bundler version 1.17.3
  spec.add_development_dependency "bundler", "1.17.3"
  # rake version 10.4.2
  spec.add_development_dependency "rake", "10.4.2"
  spec.add_development_dependency "payshares-xdrgen"
  spec.add_development_dependency "rspec", "3.2.0"
  spec.add_development_dependency "guard-rspec", "4.5.0"
  spec.add_development_dependency "simplecov", "0.9.2"
  spec.add_development_dependency "octokit", "4.19.0"
  spec.add_development_dependency "netrc", "0.11.0"
  spec.add_development_dependency "yard", "0.8.7.6"

end
