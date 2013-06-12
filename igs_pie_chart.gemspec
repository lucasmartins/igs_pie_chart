#encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "igs_pie_chart/version"
require 'date'

Gem::Specification.new do |s|
  s.name        = 'igs_pie_chart'
  s.version     = Igs::Pie::Version::STRING
  s.required_ruby_version = '>= 1.9.1'
  s.date        = Date.today
  s.summary     = "Pie Chart is a gem for pizza making."
  s.description = "#{s.summary} It uses D3 (Data Driven Documents) to aggregate the data and render the SVG awesomeness."
  s.authors     = ["Lucas N. Martins"]
  s.email       = 'lucasmartins@railsnapraia.com'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'https://github.com/lucasmartins/igs_pie_chart'
  s.license     = 'MIT'
  s.add_dependency 'd3_rails', '>= 3.1.10'
  s.add_dependency 'i18n', '> 0.6.1'
end