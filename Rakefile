# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
#require "rake/extensiontask"

RSpec::Core::RakeTask.new(:spec)

# Rake::ExtensionTask.new :xpring do |ext|
#   ext.tmp_dir = File.expand_path(File.dirname(__FILE__))
#   ext.lib_dir = "lib/xpring"
# end

task :default => :spec
