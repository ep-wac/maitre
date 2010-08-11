# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Maitre::Application.initialize!

# set the proper HTML Doctype using HAML
Haml::Template.options[:format] = :html5
