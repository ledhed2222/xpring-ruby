# frozen_string_literal: true

require_relative "lib/xpring/version"

Gem::Specification.new do |spec|
  spec.name          = "xpring"
  spec.version       = Xpring::VERSION
  spec.authors       = ["Greg Weisbrod"]
  spec.email         = ["greg.weisbrod@gmail.com"]
  spec.required_ruby_version = [">= 2.3", "< 2.7.0"]

  spec.summary       = "A Ruby SDK for the XRP ledger"
  spec.homepage      = "https://github.com/ledhed2222/xpring-ruby"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ledhed2222/xpring-ruby"

  spec.files = Dir.glob("lib/**/*.{rb,js}")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "grpc", "~> 1.26"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "grpc-tools"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "yard"
end
