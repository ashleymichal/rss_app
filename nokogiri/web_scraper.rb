require 'nokogiri'
require 'open-uri'
require 'time'

class Article
	attr_reader :headline, :preview, :path, :date

	def initialize raw_article
		@headline = raw_article.at_xpath('h1').content
		@preview = raw_article.at_xpath('div[@class = "entry"]/p').content
		@path = raw_article.at_xpath('a')['href']
		@date = Time.parse(raw_article.at_xpath('div[@class = "date"]').content)
	end

end

if __FILE__ == $0
	root_url = 'http://ashleymichal.github.io'

	# Fetch and parse HTML document
	doc = Nokogiri::HTML(open(root_url))

	articles = doc.xpath('//article')

	# Once new article is created, will store as object
	# Ponder how to prevent duplicates.... recall that
	# open-uri will return add'l information including
	# 'created-at'. Perhaps first check DB for most
	# recent post and only pull after that?
	articles.each do |article|
		a = Article.new(article)
		puts a.headline
		puts a.preview
		puts a.path
		puts "Posted on #{a.date}"
	end
end