Travelblog
==========

Description
-----------

The Ruby On Rails Travelblog provides a Webpage for Travellers who like to share their experience...
![Journeys](/preview/1JourneysIndex.png)
![JourneysSignedIn](/preview/2JourneysIndexSignedIn.png)
![Journey](/preview/3JourneyShow.png)

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
- Login with:
	Email: change_email@example.com
	Password: change_pwd
- in config/environments/development.rb:
	Enter emailaddress and password for account with which to send reset password emails


Installation - Hosted Blog
--------------------------

- Make sure starting the Ruby on Rails webserver in productive mode
- Configure Google Maps API Key in the productive app configration
- Change your login credentials
- Configure Mandrill or other E-Mail Server for passwort resets and write it in production.rb


Third Party
-----------

Gems provided through the gemfile are third party.
In the ``vendor`` folder the third party softwares ``Galleria`` and ``Bootstrap`` are provided within this software. Find sources and licenses inside the folders or at the Galleria and Bootstrap homepages.
