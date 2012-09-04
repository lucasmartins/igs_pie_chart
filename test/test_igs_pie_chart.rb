require 'test/unit'
require 'igs_pie_chart'
require 'erb'

class IgsPieChartTest < Test::Unit::TestCase

  HTML_TEST_OUTPUT='test.output.html'
  JS_TEST_OUTPUT='test.output.js'

  def test_pie_chart_rendering
    pie = IgsPieChart.new(200,0.4,'body',{'um'=>1,'dois'=>2,'tres'=>3,'cinco'=>5,'oito'=>8,'treze'=>13,'vinte1'=>21,'trinta4'=>34,'cinq5'=>55,'oito9'=>89,'cqq'=>144})
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
      `open #{HTML_TEST_OUTPUT}`
    rescue Exception => e
      puts "Ouch! #{e}"
    end

  end

end