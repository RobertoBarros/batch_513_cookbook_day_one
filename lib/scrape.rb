require 'nokogiri'
require 'open-uri'

puts "Enter ingredient:"
ingredient = gets.chomp

url = "https://www.allrecipes.com/search/results/?wt=#{ingredient}"

doc = Nokogiri::HTML(open(url), nil, 'utf-8')

results = []

doc.search('.fixed-recipe-card').first(5).each do |card|
  name = card.search('h3').text.strip
  url = card.search('h3 a').attribute('href').value

  results << { name: name, url: url }
end

results.each_with_index do |result, index|
  puts "#{index + 1} #{result[:name]} - #{result[:url]}"
end

puts "Enter index"
index = gets.chomp.to_i - 1

url_detail = results[index][:url]

doc = Nokogiri::HTML(open(url_detail), nil, 'utf-8')

description = doc.search('.recipe-summary').text.strip

puts description





