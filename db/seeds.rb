# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

repo_list_items = page.css(".repo-list li")

repos_attributes = []
repo_list_items.each do |repo_item|
  name = repo_item.css("h3").text.strip
  description = repo_item.css("p").text.strip
    if defined?(repo_item.css("span")[3].text.strip)
      language = repo_item.css("span")[3].text.strip
    else
      language = "N/A"
    end
    if defined?(repo_item.css("span")[4].elements[0].attributes["href"].value)
      contributors = repo_item.css("span")[4].elements
      contributors.shift()
      contributors_array = []
      contributors.each do |contributor|
        contributors_array << contributor.attributes["href"].value.gsub('/', '@') + " "
      end
      contributor_string = contributors_array.join(",")
    else
      name_string = repo_item.css("h3").text.strip
      name_array = name_string.split(/\s* \s*/)
      contributor_string = "@" + name_array[0]
    end
  repos_attributes << {name: name, description: description, language: language, contributors: contributor_string}
end

repos_attributes.each do |repo|
  Repo.create(repo)
end
