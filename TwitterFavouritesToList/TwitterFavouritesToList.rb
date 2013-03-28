=begin

Purpose:

Script to add all twitter favourites for a user into a TODO list application. 
The application used in based on the configuration file. 

This script is configured through a .twitter file, which should exist in the users 
home directory. A sample.twitter file is provided to show the basic file format. 

The "import_application" element is used by the ApplicationWorkerFactory class, that 
determines the correct implementation of ApplicationWorkerIF that is used to process 
the tasks to be created.

This file will be updated by this script to keep a handle on the newest tweet which 
a task was created for. The element "lastProcessedTweet" will be added to keep track of
the id of the last tweet processed, to prevent processing the same tweet multiple times.

Requires: 
sudo gem install twitter
sudo gem install contractual
sudo gem install rb-appscript

Author: David Hutchison
http://devwithimagination.wordpress.com/

=end

require_relative 'ConfigStore'
require_relative 'ApplicationWorkerFactory'
require 'twitter'
require 'appscript'

include Appscript

#Using a float here so we can use ceil in division operations
MAXIMUM_FAVOURITES_PER_PAGE = 20.0


#Load in information from the configuration
twitterConfig = ConfigStore.new( "#{ENV['HOME']}/.twitter" )
username = twitterConfig['username']
raise ArgumentError, 'username configuration option missing' if username == nil
context = twitterConfig['new_task_context']
lastProcessedTweet = twitterConfig['lastProcessedTweet']

#Configure authentication
raise ArgumentError, 'consumer_key configuration option missing' if twitterConfig['consumer_key'] == nil
raise ArgumentError, 'consumer_secret configuration option missing' if twitterConfig['consumer_secret'] == nil
raise ArgumentError, 'oauth_token configuration option missing' if twitterConfig['oauth_token'] == nil
raise ArgumentError, 'oauth_token_secret configuration option missing' if twitterConfig['oauth_token_secret'] == nil
Twitter.configure do |config|
  config.consumer_key = twitterConfig['consumer_key']
  config.consumer_secret = twitterConfig['consumer_secret']
  config.oauth_token = twitterConfig['oauth_token']
  config.oauth_token_secret = twitterConfig['oauth_token_secret']
end

#clean up the loaded context information
if(context != nil && !context.strip.empty?)
	#Strip any leading or tailing whitespace
	context = context.strip
	if(!(context.start_with?('@')))
		context = "@#{context}"
	end
else
	#Just use a blank
	context = ""
end

#Work out the correct application name to use
appWorkerFactory = ApplicationWorkerFactory.new
appWorker = appWorkerFactory.getApplicationWorker(twitterConfig['import_application'])

puts "Using application \"#{appWorker.getApplicationName()}\"."

#This is far from perfect, as we cannot get an accurate count of the number 
#of favourites since a given id. Worse case scenario is the user has a large number
#of favourites, resulting in wasted page call queries. 
#TODO: Fix this 
totalFavourites = Twitter.user( username )['favourites_count']
totalFavouritePages = (totalFavourites / MAXIMUM_FAVOURITES_PER_PAGE).ceil

# if there is a possibility of loading more tweets, launch the application if required. 
wasRunning = true

application=Appscript.app(appWorker.getApplicationName())
begin
  wasRunning = false
  application.run
end unless application.is_running?

#Keep track of the latest tweet processed, will update the configuration file later
lastTweet = nil

importedTweets = 0

totalFavouritePages.downto( 1 ) do |pageNumber|
  puts "Attempting to get tweets for page number: #{pageNumber}"

  begin
    begin
    	if(lastProcessedTweet != nil)
      		page = Twitter.favorites( :user => username, :page => pageNumber, :since_id => lastProcessedTweet )
      else
      	page = Twitter.favorites( :user => username, :page => pageNumber )
      end
    rescue Twitter::Error::NotFound => e
      puts e.message
      sleep 5
      retry
   	end


    unless (page == nil || page.empty?)
      page.reverse.each { |tweet|
        begin
        	sourceDescription = "Tweet from #{tweet.user.name}"
        	sourceURL = "http://twitter.com/#{tweet.user.screen_name}/statuses/#{tweet.id}"
        	taskText = "#{tweet.text}"
        	appWorker.addTask(sourceDescription, sourceURL, context, taskText)
        
        importedTweets += 1
        lastTweet = tweet.id
        
        rescue => e
          puts "Had a problem creating task for tweet #{tweet.id} : #{e.message}"
        end
      }
    end
  rescue Twitter::Error::TooManyRequests => error
    twitter_API_rate_reset_time_in_seconds = error.rate_limit.reset_in
    minutes_until_rate_limit_is_reset = ( twitter_API_rate_reset_time_in_seconds / 60.0 )
    puts "Sorry, we've exceeded the Twitter-imposed rate limit for accessing their service.  We'll have to wait #{minutes_until_rate_limit_is_reset} minutes before this account can access Twitter again."
    sleep twitter_API_rate_reset_time_in_seconds
    retry
  rescue Twitter::Error::ServiceUnavailable => e
    sleep 5
    retry
  end
end

puts "Successfully imported #{importedTweets} tweets into #{appWorker.getApplicationName()}"

if(lastTweet != nil)

	twitterConfig['lastProcessedTweet'] = lastTweet
	twitterConfig.save()

end

#If the application was not running when this script started, then quit it again
application.quit if !wasRunning
	
