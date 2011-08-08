=begin

Purpose:

Script to add all twitter favourites for a user into the inbox list in The Hit List.
This script is configured through a .twitter file, which should exist in the users 
home directory. A sample.twitter file is provided to show the basic file format. 
This file will be updated by this script to keep a handle on the newest tweet which 
a task was created for. The element "lastProcessedTweet" will be added to keep track of
the id of the last tweet processed, to prevent processing the same tweet multiple times.

The created task will have a title in the form:
"Tweet from <user display name>"
and a note in the form:
"<tweet text>

<link to tweet>"
The start date for the task is date the task was run. Originally (and still commented out), the creation date of the tweet was used instead.

Requires: 
sudo gem install twitter
sudo gem install rb-appscript

Author: David Hutchison
http://devwithimagination.wordpress.com/

=end

require 'ConfigStore'
require 'twitter'
require 'appscript'

include Appscript

#Using a float here so we can use ceil in division operations
MAXIMUM_FAVOURITES_PER_PAGE = 20.0


#Load in information from the configuration
twitterConfig = ConfigStore.new( "#{ENV['HOME']}/.twitter" )
username = twitterConfig['username']
context = twitterConfig['new_task_context']
lastProcessedTweet = twitterConfig['lastProcessedTweet']

#clean up the loaded context information
if(context != nil)
	#Strip any leading or tailing whitespace
	context = context.strip
	if(!(context.start_with?('@')))
		context = "@#{context}"
	end
else
	#Just use a blank
	context = ""
end

#This is far from perfect, as we cannot get an accurate count of the number 
#of favourites since a given id. Worse case scenario is the user has a large number
#of favourites, resulting in wasted page call queries. 
#TODO: Fix this 
totalFavourites = Twitter.user( username )['favourites_count']
totalFavouritePages = (totalFavourites / MAXIMUM_FAVOURITES_PER_PAGE).ceil

# if there is a possibility of loading more tweets, launch thl
# Load Hit List and check if running
wasRunning = true

thl=Appscript.app('The Hit List')
begin
  wasRunning = false
  thl.run
end unless thl.is_running?


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
    rescue Twitter::NotFound => e
      puts e.message
      sleep 5
      retry
    rescue => e
      puts e.message
    end

    unless (page == nil || page.empty?)
      page.reverse.each { |tweet|
        begin
        thl.inbox.make(:new => :task, :with_properties => {
            :timing_task => "Tweet from #{tweet.user.name} #{context}",
            :notes => "#{tweet.text} \n\n http://twitter.com/#{tweet.user.screen_name}/statuses/#{tweet.id}",
            :start_date => Date.today
            #:start_date => DateTime.parse("#{tweet.created_at}")
        })
        
        importedTweets += 1
        lastTweet = tweet.id
        
        rescue => e
          puts "Had a problem creating task for tweet #{tweet.id} : #{e.message}"
          $! = TRUE
        end
      }
    end
  rescue Twitter::BadRequest => e
    twitter_API_rate_reset_time_in_seconds = Twitter.rate_limit_status.reset_time_in_seconds
    minutes_until_rate_limit_is_reset = ( twitter_API_rate_reset_time_in_seconds - Time.now.to_i ) / 60.0
    puts "Sorry, we've exceeded the Twitter-imposed rate limit for accessing their service.  We'll have to wait #{minutes_until_rate_limit_is_reset} minutes before this account can access Twitter again."
    sleep twitter_API_rate_reset_time_in_seconds
    retry
  rescue Twitter::ServiceUnavailable => e
    sleep 5
    retry
  end
end

puts "Successfully imported #{importedTweets} tweets into The Hit List"

if(lastTweet != nil)

	twitterConfig['lastProcessedTweet'] = lastTweet
	twitterConfig.save()

end

#If THL was not running when this script started, then quit it again
thl.quit if !wasRunning
	