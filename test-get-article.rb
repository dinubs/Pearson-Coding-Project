require 'rubygems'
require 'open-uri'
require 'readability'
def get(page)
	begin
		source = Nokogiri::HTML(open(page))
	rescue => e
		puts 'error'
		puts e
		return
	end
	content = Readability::Document.new(source).content
	puts content
end

get('http://ft-researcher.herokuapp.com/articles/1530/')
#get('http://www.wired.com/2014/12/gift-guide-last-minute/')
