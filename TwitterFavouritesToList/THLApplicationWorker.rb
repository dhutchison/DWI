=begin

Implementation of ApplicationWorkerIF for The Hit List.

The created task will have a title in the form:
"<source description> <context>"
and a note in the form:
"<task text>

<source url>"
The start date for the task is date the task was created.

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
	def addTask(sourceDescription, sourceURL, context, taskText)
	
		application=Appscript.app(self.getApplicationName())
	
		application.inbox.make(:new => :task, :with_properties => {
		    :timing_task => "#{sourceDescription} #{context}",
		    :notes => "#{taskText} \n\n #{sourceURL}",
		    :start_date => Date.today
		})
	end

end