require 'nokogiri'
require 'open-uri'

class Article
	attr_reader :headline, :preview, :path

	def initialize raw_article
		@headline = raw_article.at_xpath('h1').content
		@preview = raw_article.at_xpath('div/p').content
		@path = raw_article.at_xpath('a')['href']
	end
end

if __FILE__ == $0
	root_url = 'http://ashleymichal.github.io'

	# Fetch and parse HTML document
	doc = Nokogiri::HTML(open(root_url))

	articles = doc.xpath('//article')

	articles.each do |article|
		a = Article.new(article)
		puts a.headline
		puts a.preview
		puts a.path
	end
end