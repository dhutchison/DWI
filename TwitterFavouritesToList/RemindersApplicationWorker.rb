=begin

Implementation of ApplicationWorkerIF for the Reminders app.

The created task will have a title in the form:
"Tweet from <user display name>"
and a note in the form:
"<tweet text>

<link to tweet>"
The reminder will have no due date. This functionality may be added later.

Author: David Hutchison
http://devwithimagination.wordpress.com/
=end

require_relative 'ApplicationWorkerIF'
require 'appscript'

class RemindersApplicationWorker < ApplicationWorkerIF

	def getApplicationName()
		return "Reminders"
	end
	
	#Add a new task with the supplied properties.
	def addTask(tweetUserName, tweetUserScreenName, tweetID, context, tweetText)
	
		application=Appscript.app(self.getApplicationName())
	
		#Applescript dictionary defines this list as "default list", rbappscript uses an underscore to replace spaces in situations like this.
		application.default_list.make(:new => :reminder, :with_properties => {
			:name => "Tweet from #{tweetUserName} http://twitter.com/#{tweetUserScreenName}/statuses/#{tweetID} #{context}",
			:body => "#{tweetText}",
		})
	end

end