require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

desc "Build gem"
task :build do
  `rm *.gem`
  puts `gem build *.gemspec`
end

desc "Install gem"
task :install do
	puts `gem install *.gem`
end