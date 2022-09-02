# README

To run this app on your local machine (mac/ubuntu/ any other Linux based):

make sure you got the ruby version installed see (.ruby-version file)

make sure you have redis installed on your system and run `redis-server --daemonize yes`

run: `bundle install`

run: `rails db:setup`

run: `bundle exec sidekiq` (in separate terminal)

run: `mailcatcher` (in separate terminal)

run: `rails s`

For test case

run: `bundle exec rspec`

Now go to Postman and import this API for testing

  `POST http://localhost:3000/api/v1/auth`

  `POST http://localhost:3000/api/v1/sign_in`

  `GET http://localhost:3000/api/v1/recieved_messages`

Steps Need to follow

  1 - Create a user using API or use existing(seed) user

  2 - Sign in the user with `api/v1/auth` API using email and password

  3 - Get client, access_token, uid from the headers of successful sign in request

  4 - Set these three values into environment variable on Postman. Ref: https://learning.postman.com/docs/sending-requests/variables/

  5 - Run API for `recieved_messages` to verify the user is recieving messages randomly after each minute (by viewing `created_at` time for each record)


Assumptions

  The recieved_messaged will fetch available messages from our database using API.

  I did not use any gem as we have to only give API endpoint for creating, but when we need to work on advance we can use  active_model_serializers, jsonapi-rb or blueprinter and even can make our custom validator for each action upon need

  I have made code generic which will make any model basic API without writing any code in the controller
