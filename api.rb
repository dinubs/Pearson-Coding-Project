require 'json'
require 'net/http'


system "clear" or system "cls"
def publish_to_api(articleId)
  	tempUri = URI("http://api.pearson.com:80/v2/ft/articles/#{articleId}")
	tempData = Net::HTTP.get(tempUri)
	tempStuff = JSON.parse(tempData)
	# puts tempStuff["result"]["headline"]
	# puts tempStuff["result"]["text"]
	# puts tempStuff["id"]
	Article.create :articleId => tempStuff["id"], :title => tempStuff["result"]["headline"], :content => tempStuff["result"]["text"]
rescue JSON::ParserError => e
	puts "Sleeping for a bit zzz"
	sleep 30
  	retry
end

def getArticles(offset)
	uri = URI("http://api.pearson.com:80/v2/ft/articles?offset=#{offset}")
	data = Net::HTTP.get(uri)
	JSON.parse(data)
rescue JSON::ParserError
	puts "Sleeping for a bit zzz"
	sleep 30
	retry
end

curOffset = Article.count

offset = 10

stuff = getArticles(curOffset)

total = stuff["total"]

numRounds = (total.to_i / offset) + 1
puts numRounds

for i in 0..numRounds
	stuff = getArticles(curOffset)

	total = stuff["total"]
	results = stuff["results"]
	results.each do |r|
		publish_to_api(r["id"])
		system "clear" or system "cls"
		puts "#{(curOffset / numRounds )}%"
	end
	curOffset = curOffset + offset
	system "clear" or system "cls"
	puts "#{(i / numRounds ) * 100}%"
end