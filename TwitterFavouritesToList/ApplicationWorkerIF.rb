=begin
Interface defining methods that are required to work with an application.

Author: David Hutchison
http://devwithimagination.wordpress.com/
=end

require 'contractual'

class ApplicationWorkerIF
  include Contractual::Interface

  must :getApplicationName
  must :addTask, :tweetUserName,  :tweetUserScreenName, :tweetID, :context, :tweetText

end