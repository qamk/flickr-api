# FlickrApi
This project involved using an API, the Flickr API, to display images when given a valid Owner ID. I do not intend to deploy this project. Using Rails 6.1

## Setting Environment Variables
I decided to set up **environment variables** instead of using [Figaro](https://github.com/laserlemon/figaro), which is a good alternative. In the resources section I will include a link to creating environment variables in Ubuntu but the basic steps are:
1. Find ~/.profile, ~/.bashrc or ~/.bash-profile (to name a few)
2. Put `export FLICKR_KEY=value` and save
3. Log out and back in to your account
4. Open up the terminal and check environment variables using:
  - `env` or `printenv`
  - `env | grep [PATTERN]` or `printenv | grep [PATTERN]` to search the output for PATTERN
When deployed, you will have to refer to the host's documentation for setting environment variables.

## Running the app
After cloning the repo with 
`git clone git@github.com/qamk/flickr-api.git`
Enter the project directory `cd flickr-api`
Install the gems in the GEMFILE with 
`bundle install`
and run the server with `bin/rails s`

## What's the services folder about?
Thanks to [this guide](https://medium.com/food4fluctuations/using-an-api-in-rails-for-noobs-5e02edb0e56b) I created a services directory that contains the class I use to send requests to the API and handle the JSON response.

## Resources
- Environment Variables
  - For rails apps: https://railsapps.github.io/rails-environment-variables.html
  - Ubuntu guide: https://help.ubuntu.com/community/EnvironmentVariables
- Flickr API docs
  - https://www.flickr.com/services/api/
- Rails' Logging
  - https://guides.rubyonrails.org/debugging_rails_applications.html#the-logger
    - This was useful to see what the HTTP gem was receiving
- Controller with at least two words (Rails 4 but it worked for me)
  - https://stackoverflow.com/questions/19607305/routing-for-controllers-with-multiple-words-in-in-rails-4

## Discussion
Using APIs is fun. I've gotten fairly used to reading various documentation, so reading the API was a quick way to be acquanted with what requests and resources to access. Still, the API documentation was quite clear and the API explorer was efficacious.
As a result, this was a fairly simple project, but I still managed to learn more than expected which is great!