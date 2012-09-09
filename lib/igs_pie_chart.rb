#encoding: utf-8
require 'erb'

module Igs
end

unless "".respond_to? 'camelize'
  class String
    def camelize
      return self if self !~ /_/ && self =~ /[A-Z]+.*/
      split('_').map{|e| e.capitalize}.join
    end
  end
end

class Igs::PieChart

  # data=[100,299,234,55]
  def initialize(size,endomargin=0,target_element='body',data)
    @size = size
    @endomargin = endomargin
    @data = data.values
    @labels = data.keys
    @target_element = target_element
  end

  def render
    begin
      path = File.expand_path("../../templates/pie_chart.html.erb", __FILE__)  
      rendering = ERB.new(File.read(path)).result(binding)
    rescue Exception => e
      STDERR.puts "Erro ao renderizar JavaScript! #{e}"
      rendering = nil
    end
    return rendering
  end

  def to_s
    render
  end

  def data=(data)
    @data=data
  end

  def width=(width)
    @width = width
  end

  def height=(height)
    @height = height
  end

end