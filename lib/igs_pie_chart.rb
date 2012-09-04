#encoding: utf-8
require 'erb'

class IgsPieChart

  # data=[100,299,234,55]
  def initialize(size,endomargin=0,target_element='body',data)
    @size = size
    @endomargin = endomargin
    @data = data
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