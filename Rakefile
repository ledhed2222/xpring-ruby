# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"
require "xpring/javascript"

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

task default: :spec

namespace :clean do
  task :proto do
    proto_source_path = File.expand_path("./rippled", __dir__)
    FileUtils.rm_rf(proto_source_path)
    proto_dest_path = File.expand_path("./lib/org", __dir__)
    FileUtils.rm_rf(proto_dest_path)
  end

  task :js do
    js_path = File.expand_path("./xpring-common-js", __dir__)
    FileUtils.rm_rf(js_path)
    FileUtils.rm_f(Xpring::Javascript::LIBRARY_PATH)
  end

  task :doc do
    doc_path = File.expand_path("./doc", __dir__)
    FileUtils.rm_rf(doc_path)
  end

  desc "Clean dependencies"
  task dependencies: [:proto, :js, :doc]
end

namespace :build do
  task :proto do
    before_dir = Dir.pwd
    Dir.chdir(__dir__)
    `git submodule update --remote --init --recursive rippled`
    proto_dir = File.expand_path("./rippled/src/ripple/proto", __dir__)
    proto_path = File.expand_path("./rippled/src/ripple/proto/org/xrpl/rpc/v1/*.proto", __dir__)
    lib_path = File.expand_path("./lib", __dir__)
    `grpc_tools_ruby_protoc \
      --proto_path=#{proto_dir} \
      --ruby_out=#{lib_path} \
      --grpc_out=#{lib_path} \
      #{proto_path}`
    Dir.chdir(before_dir)
  end

  task :js do
    before_dir = Dir.pwd
    Dir.chdir(__dir__)
    `git submodule update --remote --init --recursive xpring-common-js`
    Dir.chdir(File.expand_path("./xpring-common-js", __dir__))
    `npm i`
    `npm run webpack`
    lib_dir = File.dirname(Xpring::Javascript::LIBRARY_PATH)
    Dir.mkdir(lib_dir) unless Dir.exist?(lib_dir)
    FileUtils.cp("dist/index.js", Xpring::Javascript::LIBRARY_PATH)
    Dir.chdir(before_dir)
  end

  task :doc do
    before_dir = Dir.pwd
    Dir.chdir(__dir__)
    `yard doc --exclude lib/org/* lib/*`
    Dir.chdir(before_dir)
  end

  desc "Build dependencies"
  task dependencies: [:proto, :js, :doc]
end

task build: :"build:dependencies"
task clean: :"clean:dependencies"
