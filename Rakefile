# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :build_proto do
  `git submodule update --remote rippled`
  `grpc_tools_ruby_protoc --proto_path=./rippled/src/ripple/proto --ruby_out=lib --grpc_out=lib ./rippled/src/ripple/proto/org/xrpl/rpc/v1/*.proto`
end

task :build_js do
  `git submodule update --remote xpring-common-js`
  before_dir = Dir.pwd
  Dir.chdir("xpring-common-js")
  `npm i`
  `npm run webpack`
  FileUtils.cp("dist/index.js", "../ext/xpring/xpring.js")
  Dir.chdir(before_dir)
end

desc "Build dependencies"
task :build_dependencies => [:build_proto, :build_js]

