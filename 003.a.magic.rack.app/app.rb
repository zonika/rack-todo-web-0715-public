# We need a few superpowers for this example. Obviously,
require 'rack'
require 'pry'

# Ignore this line.
Signal.trap('INT') {Rack::Handler::WEBrick.shutdown}

# Now let's grab the superpower twitter.

# https://github.com/sferik/twitter

# First, install the twitter gem from your terminal.

# gem install twitter

# Great, let's get it in this script.

require 'twitter'

Twitter.configure do |config|
  # I got this information from creating a new twitter application
  # under my developer account. 
  # https://dev.twitter.com/apps
  config.consumer_key = "9vahfyWzOnjJxj83SJxROQ"
  config.consumer_secret = "aYCt7k10fYf4svlSNz9oP7GbFi1QYPnUdvpOZpjgwYM"
  config.oauth_token = "2085091-QdSttXlwq50BXqOUrNmd2zIPdQyxP873TzzsKhW8k"
  config.oauth_token_secret = "MxwEh2JRvmHBYcMfsFv3o0MYhMx2yM77tVABftVboAE"
end

# What do you think is going on up there? Well the twitter gem gives us a class,
# Twitter. We're configure the class with our credentials. Now that class basically
# represents twitter.

# Let's make our rack app.

class App
  def call(env)
    html = "<h1>What people are saying about Flatiron School</h1>"
    html << "<ul>"

    # So far we've created an HTML string. Now the fun part. 
    # Let's search twitter.
    twitter_search_results = Twitter.search("flatironschool")
    twitter_search_results.statuses.each do |tweet|
      # So now we have these individual tweet objects, twitter statuses.
      
    [200, {'Content-Type' => 'text/html'}, [response]]
  end
end

