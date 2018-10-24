require 'nokogiri'
require 'open-uri'
require 'pry'
require 'pp'

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

# fetch all of the HTML `<li>` elements that represent individual repositories
repo_list_items = page.css(".repo-list li")

#output the first repository's name

repo_list_items.each do |repo_item|
  puts "--------------------"
  puts repo_item.css("h3").text.strip
  puts "============================"
  puts repo_item.css("p").text.strip
  if defined?(repo_item.css("span")[3].text.strip)
    puts "Written primarily in "+ repo_item.css("span")[3].text.strip
  else
    puts "Written primarily in N/A"
  end
  # binding.pry
  if defined?(repo_item.css("span")[4].elements[0].attributes["href"].value)
    puts "Primary Contributors: "
    contributors = repo_item.css("span")[4].elements
    contributors.shift()
    contributors.each do |contributor|
      print contributor.attributes["href"].value.gsub('/', '@') + " "
    end
    print "\n"
  else
    puts "Primary Contributor: "
    name_string = repo_item.css("h3").text.strip
    name_array = name_string.split(/\s* \s*/)
    puts "@" + name_array[0]
  end
  puts "--------------------\n\n\n"
end
