# Copy your solution from hashes_exercise.rb
# We're going to use a remote data source to pull in stories, apply categories
# and have them upvoted based on our rules.
# http://mashable.com/stories.json
# http://digg.com/api/news/popular.json
# http://www.reddit.com/.json
# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to a array and display your "Front page"
# Figure out how to get to the data you need in the source you choose

require 'rest-client'
require 'json'

stories = {}
stories_array = []

def show_message(message)
  puts message
end

def get_input
  gets.strip 
end

def show_new_story_notification(story, category, upvotes)
  show_message("New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}")
end

def calculate_upvotes(story, category)
  upvotes = 1

  if story.downcase.include? 'cat'
    upvotes *= 5
  elsif story.downcase.include? 'bacon'
    upvotes *=8
  end

  if category.downcase == "food"
    upvotes *= 3
  end
  upvotes
end

##### NEW CODE #####

result = RestClient.get "http://mashable.com/stories.json"
result_hash = JSON.load(result)

# Just printing out all the titles here, just to demonstrate to myself that this syntax is accessing them
#result_hash["hot"].each {|story| puts story["title"]}

#doing all the stuf
result_hash["hot"].each do |str| 
	story = {}
	story["title"] = str['title']
	story["category"] = str['channel']
	story["upvotes"] = calculate_upvotes(str['title'], str['channel'])
	stories_array.push(story)
end

puts "This is the 'Front Page'"
puts stories_array

#show_message("Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!")
#show_message("Please enter a News story:")
#story = get_input
#stories["title"] = story
#show_message("Please give it a category:")
#category = get_input
#stories["category"] = category
#upvotes = calculate_upvotes(story, category)
#stories["upvotes"]= upvotes
#show_new_story_notification(story, category, upvotes)

