# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"
require "xpring/javascript"

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

task default: :spec

task build: :"build:dependencies"

namespace :build do
  task :proto do
    `git submodule update --remote rippled`
    proto_dir = File.expand_path("./rippled/src/ripple/proto", __dir__)
    proto_path = File.expand_path("./rippled/src/ripple/proto/org/xrpl/rpc/v1/*.proto", __dir__)
    lib_path = File.expand_path("./lib", __dir__)
    `grpc_tools_ruby_protoc \
      --proto_path=#{proto_dir} \
      --ruby_out=#{lib_path} \
      --grpc_out=#{lib_path} \
      #{proto_path}`
  end

  task :js do
    `git submodule update --remote xpring-common-js`
    before_dir = Dir.pwd
    Dir.chdir(File.expand_path("./xpring-common-js", __dir__))
    `npm i`
    `npm run webpack`
    lib_dir = File.dirname(Xpring::Javascript::LIBRARY_PATH)
    Dir.mkdir(lib_dir) unless Dir.exist?(lib_dir)
    FileUtils.cp("dist/index.js", Xpring::Javascript::LIBRARY_PATH)
    Dir.chdir(before_dir)
  end

  desc "Build dependencies"
  task dependencies: [:proto, :js]
end
