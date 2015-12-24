require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://www.nokogiri.org/tutorials/installing_nokogiri.html'))

# ####
# # Search for nodes by css
# doc.css('nav ul.menu li a').each do |link|
# 	puts link.content
# end

####
# Search for nodes by xpath
doc.xpath('//h2 | //h3').each do |link|
	puts link.content
end

# ####
# # Or mix and match
# doc.search('code.sh', '//h2').each do |link|
# 	puts link.content
# end