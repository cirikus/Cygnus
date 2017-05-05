# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Time::DATE_FORMATS[:custom_date] = "%d %B %Y"
Time::DATE_FORMATS[:custom_time] = "%H:%M %p"
