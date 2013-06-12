require 'bundler'
require 'rake/testtask'
Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Build Gem"
task :default => :build
