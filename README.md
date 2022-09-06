# README

## Running the Application

To run this app on your local machine (mac/ubuntu/ any other Linux based):

make sure you got the ruby version installed see (.ruby-version file)

make sure you have redis installed on your system and run `redis-server --daemonize yes`

* `bundle install`

* `rails db:setup`

* `bundle exec sidekiq` (in separate terminal)

* `mailcatcher` (in separate terminal)

* `rails s`

## Testing the Application

* `bundle exec rspec`

Now go to Postman and import this API for testing

1. `POST http://localhost:3000/api/v1/auth`

2. `POST http://localhost:3000/api/v1/sign_in`

3. `GET http://localhost:3000/api/v1/recieved_messages`

  Postman Collection: [Email Scheduler](https://www.getpostman.com/collections/d91631085f9afb205b28)

## Steps need to Follow

1. Create a user using API or use existing(seed) user

2. Sign in the user with `api/v1/auth` API using email and password

3. Get client, access_token, uid from the headers of successful sign in request

4. Set these three values into environment variable on Postman. Ref: https://learning.postman.com/docs/sending-requests/variables/

5. Run API for `recieved_messages` to verify the user is recieving messages randomly after each minute (by viewing `sent_at` time for each record)

## Design Decisions
* Model Classes: `User`, `Message`, `RecievedMessage`
* `User` can have many `Messages` and Every `Message` can be sent to multiple users (`many-to-many`)
* `RecievedMessages` have a unique relation with `User` and `Message` so that no `User` can recieve same `Message` again.

## Algorithms
  The algorithm used for enqueing messages is when the user creates an account, it emits the job to enqueue messages and send after every minute through email.

### API Design
Using my Rails API boilerplate, all the CRUD operations of any resource can be implemented within seconds. However, I have only generated routes for the three APIs required in the technical assessment. You can add more routes for remaining CRUD operations in `api_v1.rb` file. Adding the routes is enough to run the CRUD for Restful resources.

### API Main Components:
* **Respondable**: It handles all the Restful CRUD operations. The code is generic. All you need is to make any resource controller and define its parameters.
* **Error Handler**: The error handler will cover all types of errors during Restful API calls.

## Key Assumptions

  The recieved_messaged will fetch available messages from our database using API.

  I did not use any gem as we have to only give API endpoint for creating, but when we need to work on advance we can use  active_model_serializers, jsonapi-rb or blueprinter and even can make our custom validator for each action upon need

  I have made code generic which will make any model basic API without writing any code in the controller
