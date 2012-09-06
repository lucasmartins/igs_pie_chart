IGS Pie Chart
=============

[![Build Status](https://secure.travis-ci.org/lucasmartins/igs_pie_chart.png?branch=master)](http://travis-ci.org/lucasmartins/igs_pie_chart) [![Dependency Status](https://gemnasium.com/lucasmartins/igs_pie_chart.png?travis)](https://gemnasium.com/lucasmartins/igs_pie_chart) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/lucasmartins/igs_pie_chart)


Pie Chart is a gem for pizza/donut (charts) making. It uses D3 (Data Driven Documents) to aggregate the data and render SVG awesomeness into an HTML element of your choosing.

Pie Chart is the first piece of the Innovit Gem Suite, different ways to visualize your data will be available in the near future.

Pie Chart is not production ready yet, although it works fine.

The RDoc is not available yet, but there are few files to peak and the [test](https://github.com/lucasmartins/igs_pie_chart/blob/master/test/test_igs_pie_chart.rb) shows how it works.


Requirements
------------

### Ruby and Rails

This gem is tested against the latest version of RoR, other versions are not our focus now.
Rails is not really needed, but apparently our main dependency 'd3_rails' requires you to install all Rails gems, we will work on that in the future.

### D3 (Data Driven Documents)

This gem uses the awesomeness of [D3](https://github.com/mbostock/d3), a great way to work with data, and data visualization too. So, remember you need the D3 js file available.

### SVG

The graphics generated to bring pies to life are based on SVG, all browsers should fully support SVG and its transitions but some do not, be aware of that.

Installation
------------

IGS Pie Chart is distributed as a gem, which is how it should be used in your app.

Include the gem in your Gemfile:

```ruby
gem "igs_pie_chart"
```

Or, if you want to get the bleeding edge, you can get master from the main repository:

```ruby
gem "igs_pie_chart", :git => "git://github.com/lucasmartins/igs_pie_chart.git"
```

Usage (Rails)
-------------------

Add D3 to your Rails javascript manifest (application.js):

```javascript
//= require d3.v2
```

Make your pie (controller):

```ruby
@pie = IgsPieChart.new(200,0.4,'body',{'4 Queijos'=>25,'Brócolis'=>25,'Calabresa'=>50})
```

Savor it raw (view):

```erb
<%= raw @pie.render %>
```

Breakdown
---------

```ruby
IgsPieChart.new(size,endomargin=0,target_element='body',data)
  size => "Integer, Your X and Y measures"
  endomargin => "Float, from 0 to 1, represents the internal margin, 0 for Pizza Pie, 0.5 for a nice Donut."
  target_element => "String, the target HTML element where the chart will be rendered."
  data => "Hash with the labels and floats which represents each slice of the Pizza/Donut."
```

Contributing
------------

This gem is in a very early stage.

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please post a new [GitHub Issue](http://github.com/lucasmartins/igs_pie_chart/issues)

Credits
-------

![Innovit](http://innovit.com.br/logos_innovit/logo-curvas_180.png)

IGS Pie Chart is maintained and funded by [Innovit LTDA](http://innovit.com.br)

Thank you to all [the contributors](https://github.com/thoughtbot/paperclip/contributors)!

The names and logos for Innovit are trademarks of Innovit LTDA.

License
-------

IGS Pie Chart is free software, we haven't yet studied the best license for it, MIT looks fine though.
