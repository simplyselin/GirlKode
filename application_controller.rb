require 'bundler'
Bundler.require
require_relative 'models/quizmodel.rb'

require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

# and then you can create a new client without parameters
@client = Twilio::REST::Client.new

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/another' do
    erb :newindex
  end

  get '/quiz' do
    erb :quiz
  end

  post '/process' do
    @array = [params[:question1], params[:question2], params[:question3], params[:question4], params[:question5]]
    @number = tally(@array)
    @decision = quiz(@number)
    erb :results
  end

  get '/results' do
    erb :results
  end

end
