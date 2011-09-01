# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ffcrm_tags"
  gem.homepage = "http://github.com/mwhagedorn/ffcrm_tags"
  gem.license = "MIT"
  gem.summary = %Q{gemified version of the original crm_tags plugin}
  gem.email = "mike@silverchairsolutions.com"
  gem.authors = ["Mike Hagedorn"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ffcrm_tags #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "ffcrm_tags/version"
 
task :build do
  system "gem build ffcrm_tags.gemspec"
end
 
task :release => :build do
  system "gem push ffcrm_tags-#{Bunder::VERSION}"
end


