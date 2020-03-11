# frozen_string_literal: true

require_relative "lib/xpring/version"

Gem::Specification.new do |spec|
  spec.name          = "xpring"
  spec.version       = Xpring::VERSION
  spec.authors       = ["Greg Weisbrod"]
  spec.email         = ["greg.weisbrod@gmail.com"]
  spec.required_ruby_version = ">= 2.3"

  spec.summary       = "A Ruby SDK for the XRP ledger"
  spec.homepage      = "https://github.com/ledhed2222/xpring-ruby"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ledhed2222/xpring-ruby"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.glob("lib/**/*.{rb,js}")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "grpc", "~> 1.26"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "grpc-tools"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
end
