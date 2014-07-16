# Installation
Requirements: Ruby on Rails (4.0.4)

The web application is located in the folder /appsource. Import travelblog into Aptana as a Ruby on Rails project.

Steps:
- bundle install
- rake db:migrate
- rake db:seed
- rails server
- Show Travelblog on configured web server (maybe 127.0.0.1:3000)

For running tests: rake test test/models/

# Using as an Official Hosted Blog
- Make sure starting the Ruby on Rails webserver in productive mode
- Configure Google Maps API Key in the productive app configration
- Change your login credentials

