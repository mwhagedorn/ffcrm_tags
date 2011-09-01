# -*- encoding: utf-8 -*-
 lib = File.expand_path('../lib/', __FILE__)
 $:.unshift lib unless $:.include?(lib)
  
  require 'ffcrm_tags/version'
   
   Gem::Specification.new do |s|
     s.name        = "bundler"
     s.version     =FFCRMTags::VERSION
     s.platform    = Gem::Platform::RUBY
     s.authors     = ["Mike Hagedorn"]
     s.email       = ["mike@silverchairsolutions.com"]
     s.homepage    = "http://github.com/mwhagedorn/ffcrm_tags"
     s.summary     = "Tagging for your FFCRM objects"
     s.required_rubygems_version = ">= 1.3.6"

     s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
     s.require_path = 'lib'
   end
