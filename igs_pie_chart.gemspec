Gem::Specification.new do |s|
  s.name        = 'igs_pie_chart'
  s.version     = '0.0.0'
  s.date        = Date.today
  s.summary     = "Pie Chart é uma GEM super cool pra gerar pizzas."
  s.description = "#{s.summary} Amplamente utilizado pelas Câmaras, Tribunais, e Palácios brasileiros e aclamado pela população."
  s.authors     = ["Lucas N. Martins"]
  s.email       = 'lucas.martins@innovit.com.br'
  s.files       = ["lib/igs_pie_chart.rb"]
  s.homepage    = 'http://gitlab.lan.innovit.com.br/igs_pie_chart/wikis/index'

  s.add_runtime_dependency 'd3_rails', '>= 2.10', '< 3.0'
end