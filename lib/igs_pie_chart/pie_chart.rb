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
    #TODO: break this exception handling!
    begin
      default_attribution

      path = File.expand_path("../../../templates/pie_chart.html.erb", __FILE__)  
      rendering = ERB.new(File.read(path)).result(binding)
    rescue Exception => e
      STDERR.puts "Erro ao renderizar JavaScript! #{e}"
      rendering = nil
    end
    return rendering
  end

  def default_attribution
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