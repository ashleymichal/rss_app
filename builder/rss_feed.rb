require 'rubygems'
require 'builder'
require_relative '../nokogiri/web_scraper'


if __FILE__ == $0

	root_url = 'http://ashleymichal.github.io'

	# Fetch and parse HTML document
	doc = Nokogiri::HTML(open(root_url))

	articles = doc.xpath('//article')

	articles[0..10].each do |node|
		article = Article.new(node)
		builder = Builder::XmlMarkup.new(:indent => 2)
		xml = builder.article do |entry| 
			entry.headline { |entry| entry.a(article.headline) }
			entry.written(article.date)
			entry.preview(article.preview)
		end
		puts xml
	end

end