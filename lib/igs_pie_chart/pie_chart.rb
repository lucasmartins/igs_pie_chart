class Igs::PieChart
  attr_reader :title,:size,:endomargin,:target_element,:data
  # data=[100,299,234,55]
  def initialize(title,size,endomargin=0,target_element='body',data)
    @title = title
    @size = size
    @endomargin = endomargin
    @data = data.values
    @labels = data.keys
    @target_element = target_element
    @default_attribution=false
  end

  def script
    begin
      default_attribution

      path = File.expand_path("../../../templates/_script.html.erb", __FILE__)  
      output = ERB.new(File.read(path)).result(binding)
    rescue Exception => e
      STDERR.puts "Erro ao renderizar JavaScript! #{e}"
      output = nil
    end
    return output
  end

  def style
    begin
      default_attribution

      path = File.expand_path("../../../templates/_style.css.erb", __FILE__)  
      output = ERB.new(File.read(path)).result(binding)
    rescue Exception => e
      STDERR.puts "Erro ao renderizar CSS! #{e}"
      output = nil
    end
    return output
  end

  def labels
    begin
      default_attribution

      path = File.expand_path("../../../templates/_labels.html.erb", __FILE__)  
      output = ERB.new(File.read(path)).result(binding)
    rescue Exception => e
      STDERR.puts "Erro ao renderizar Labels! #{e}"
      output = nil
    end
    return output
  end

  def render
    rendering = '<style>'
    rendering+= self.style
    rendering+= '</style>'
    rendering+= self.script
    rendering+= self.labels
    
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

private
  def default_attribution

    if @default_attribution == true
      return
    end

    @default_attribution=true
    #Default value attribution
    dsize = 300
    @width = dsize if @width == nil
    @height = dsize if @height == nil
    @endomargin = 0 if @endomargin == nil
    @width = @height = @size if @size!=nil
    
    if @data==nil
      @data=[1,1,1]
    end

    if @endomargin >= 1
      @endomargin = 0
      STDERR.puts "@endomargin must be less than 1"
    end
  end

end