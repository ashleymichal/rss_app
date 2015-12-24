require 'rubygems'
require 'builder'

builder = Builder::XmlMarkup.new(:indent => 2)
xml = builder.person { |b| b.name("Jim"); b.phone("555-1234") }
puts xml #=> <person><name>Jim</name><phone>555-1234</phone></person>