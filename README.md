Travelblog
==========

Description
-----------

The Ruby On Rails Travelblog provides a map based Webpage for Travellers who like to share their experience!
The project was started by 3 computer science students as a University project in 2014. 
After that, it was published to share it with people, who like to make use of it :-) You are welcomed to use it as a travelblog or make even further development...
Now, the project is still in development by one student, but it is not used in productive mode yet, as it feels still a bit incomplete.

A menu of all journeys the traveller made and the marked map below:
![Journeys](/preview/1JourneysIndex.png)

The traveller is logged in and can add, delete or modify Journeys:
![JourneysSignedIn](/preview/2JourneysIndexSignedIn.png)

A journeys consists of several posts:
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


Installation - Production (Hosted Blog)
---------------------------------------

- Make sure starting the Ruby on Rails webserver in productive mode
- Configure Google Maps API Key in the productive app configration
- Change your login credentials
- Configure Mandrill or other E-Mail Server for passwort resets and write it in production.rb


Third Party
-----------

Gems provided through the gemfile are third party.
In the ``vendor`` folder the third party softwares ``Galleria`` and ``Bootstrap`` are provided within this software. Find sources and licenses inside the folders or at the Galleria and Bootstrap homepages.
