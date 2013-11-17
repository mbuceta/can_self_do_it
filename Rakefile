require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r can_do_it.rb"
end

task :default => :spec
task :test => :spec
