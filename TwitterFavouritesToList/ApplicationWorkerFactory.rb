=begin
Factory for creating the correct implementation of ApplicationWorkerIF based on the supplied input.

Author: David Hutchison
http://devwithimagination.wordpress.com/
=end

require_relative 'RemindersApplicationWorker'
require_relative 'THLApplicationWorker'

class ApplicationWorkerFactory

# Get the correct ApplicationWorkerIF implementation based on the supplied input.
  def getApplicationWorker(applicationDescription)

	if("THL".eql? applicationDescription)
		return THLApplicationWorker.new
	elsif("Reminders".eql? applicationDescription)
		return RemindersApplicationWorker.new
	else
		raise ArgumentError, 'Illegal value for import_application configuration option. Allowed values are "THL" and "Reminders".'
	end

  end

end