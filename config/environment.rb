# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#em will log to the console in development environment and Logentries in production.
if !Rails.env.development?
	Rails.logger = Le.new('LOGENTRIES_TOKEN')
else
	Rails.logger = Le.new('LOGENTRIES_TOKEN', local: true)
end
