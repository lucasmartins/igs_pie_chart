require 'test/unit'
require 'igs_pie_chart'
require 'erb'

class IgsPieChartTest < Test::Unit::TestCase

  include Igs

  HTML_TEST_OUTPUT='test.output.html'
  JS_TEST_OUTPUT='test.output.js'

  def test_pie_chart_rendering
    puts "Purging #{HTML_TEST_OUTPUT}..."+`rm #{HTML_TEST_OUTPUT}`
    puts "Purging #{JS_TEST_OUTPUT}..."+`rm #{JS_TEST_OUTPUT}`
    
    #these two lines does the trick!
    pie = PieChart.new(200,0.4,'body',{'one'=>1,'two'=>2,'tree'=>3,'five'=>5,'eight'=>8,'thirteen'=>13,'twenty_one'=>21,'thirty_four'=>34,'fifty_five'=>55,'eighty_nine'=>89,'a_hundread_forty_four'=>144})
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