require 'test/unit'
require 'igs_pie_chart'
require 'erb'

class IgsPieChartTest < Test::Unit::TestCase

  HTML_TEST_OUTPUT='test.output.html'
  JS_TEST_OUTPUT='test.output.js'

  def test_pie_chart_rendering
    pie = IgsPieChart.new(200,0.4,'body',[1,2,3,5,8,13,21,34,55,89,144])
    @render = pie.render
    assert_not_equal nil, @render

    File.open('test.output.js', 'w') do |f|  
      f.write @render
    end

    path = File.expand_path("../../templates/test_pie_chart.html.erb", __FILE__)  
    html_render = ERB.new(File.read(path)).result(binding)

    File.open(HTML_TEST_OUTPUT, 'w') do |f|  
      f.write html_render
    end

    begin
      `firefox #{HTML_TEST_OUTPUT}`
    rescue Exception => e
      puts "Ouch! #{e}"
    end

  end

end