begin
  mod = Required::Module::const_get "Igs"
  #It exists
rescue NameError
  module Igs
  end
end

#encoding: utf-8
require 'erb'
require 'igs_pie_chart/pie_chart'

unless "".respond_to? 'camelize'
  class String
    def camelize
      return self if self !~ /_/ && self =~ /[A-Z]+.*/
      split('_').map{|e| e.capitalize}.join
    end
  end
end
