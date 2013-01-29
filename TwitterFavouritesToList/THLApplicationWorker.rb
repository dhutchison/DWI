=begin

Implementation of ApplicationWorkerIF for The Hit List.

The created task will have a title in the form:
"Tweet from <user display name>"
and a note in the form:
"<tweet text>

<link to tweet>"
The start date for the task is date the task was run.

Author: David Hutchison
http://devwithimagination.wordpress.com/
=end

require_relative 'ApplicationWorkerIF'
require 'appscript'

class THLApplicationWorker < ApplicationWorkerIF

	def getApplicationName()
		return "The Hit List"
	end
	
	#Add a new task with the supplied properties.
	def addTask(tweetUserName, tweetUserScreenName, tweetID, context, tweetText)
	
		application=Appscript.app(self.getApplicationName())
	
		application.inbox.make(:new => :task, :with_properties => {
		    :timing_task => "Tweet from #{tweetUserName} #{context}",
		    :notes => "#{tweetText} \n\n http://twitter.com/#{tweetUserScreenName}/statuses/#{tweetID}",
		    :start_date => Date.today
		    #:start_date => DateTime.parse("#{tweet.created_at}")
		})
	end

end