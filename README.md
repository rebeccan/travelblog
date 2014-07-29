Travelblog
==========

Description
-----------

The Ruby On Rails Travelblog provides a Webpage for Travellers who like to share their experience...


Installation - Development
--------------------------

Requirements: Ruby on Rails (4.0.4)

Import travelblog into Aptana Studio as a Ruby on Rails project.

Steps:
- bundle install
- rake db:migrate
- rake db:seed
- rails server
- Show Travelblog on configured web server (maybe 127.0.0.1:3000)

For running tests: rake test test/models/


Installation - Hosted Blog
--------------------------
# Using as an Official Hosted Blog
- Make sure starting the Ruby on Rails webserver in productive mode
- Configure Google Maps API Key in the productive app configration
- Change your login credentials


Third Party
-----------

Gems provided through the gemfile are third party.
In the ``vendor`` folder the third party softwares ``Galleria`` and ``Bootstrap`` are provided within this software. Find sources and licenses at...
