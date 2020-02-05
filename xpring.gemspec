# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "xpring"

Gem::Specification.new do |spec|
  spec.name          = "xpring"
  spec.version       = Xpring::VERSION
  spec.authors       = ["Greg Weisbrod"]
  spec.email         = ["greg.weisbrod@gmail.com"]

  spec.summary       = "xpring provides a Ruby-based SDK for the Ripple ledger"
  spec.homepage      = "https://github.com/ledhed2222/xpring-ruby"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ledhed2222/xpring-ruby"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.extensions    = "ext/xpring/extconf.rb"
  spec.require_paths = ["lib", "build"]

  spec.add_runtime_dependency "grpc"
  spec.add_runtime_dependency "google-protobuf", ">= 3.11"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "grpc-tools"
end

