# README

Event Management Application (Ruby on Rails)
===========================
An Event Management Web App built on rails and stimulus.js which supports CURD and search on events for authorised users.its integrated to Google places API's to provide accurate venue details.

- Devise authenication (sign up/sign in)
- Event name
- Event start and end date
- Embedded google map will show the event location
- Position (long/lat)
- user can create event
- user can see other users events
- Built on Bootstrap as css framework

Prerequisites
-------------
- Ruby 3.0.6
- Rails 7.0.4
- Node V14+

Getting Started
---------------
Follow these instructions to get the application up and running on your local machine.

- Install the required gems:
   bundle install
- Set up the database:
   rails db:create
   rails db:migrate
- Required credentials:
    google_api_key
- Run seed data:
   rails db:seed
- Check rspecs (test cases):
   rspec spec
- Start the Rails server:
   rails server
- Open your web browser and navigate to http://localhost:3000 to access the application.

Docker setup:
---------------

- docker-compose build
- docker-compose run web rails db:create db:migrate
- docker-compose up

Features
--------
- User registration and authentication
- Create, edit, and delete events
- View event details, including location fetched from the Google Places API
- Browse events created by other users
- User-friendly interface with bootstrap
