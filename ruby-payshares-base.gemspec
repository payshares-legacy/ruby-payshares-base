# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payshares/base/version'

Gem::Specification.new do |spec|
  spec.name          = "payshares-base"
  spec.version       = Payshares::Base::VERSION
  spec.authors       = ["Scott Fleckenstein"]
  spec.email         = ["scott@payshares.org"]
  spec.summary       = %q{Payshares client library: XDR}
  spec.homepage      = "https://github.com/payshares/ruby-payshares-base"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["generated", "lib"]

  spec.add_dependency "xdr", "~> 0.0.2"
  spec.add_dependency "rbnacl"
  spec.add_dependency "activesupport", "~> 4"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "xdrgen"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "octokit"
  spec.add_development_dependency "netrc"
  spec.add_development_dependency "yard"

end
