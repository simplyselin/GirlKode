require 'bundler'
Bundler.require
require_relative 'models/quizmodel.rb'

require 'rubygems' # not necessary with ruby 1.9 but included for completeness
# require 'twilio-ruby'

# # put your own credentials here
# account_sid = 'AC8fe5a4d8ba301c6efafaf71b70c00b42'
# auth_token = 'bfb8e8e3255f2a67ec5ed5c0469413d3'
#
# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new account_sid, auth_token
#
# # alternatively, you can preconfigure the client like so
# Twilio.configure do |config|
#   config.account_sid = account_sid
#   config.auth_token = auth_token
# end
#
# # and then you can create a new client without parameters
# @client = Twilio::REST::Client.new

class ApplicationController < Sinatra::Base

  # def textmessage(number)
  #   client.account.messages.create(
  #   from = "+14129255309"
  #   # body = "hey, lovely person! I'm glad you made this decision! Don't forget that you're awesome
  #   # with love, Papayea")
  #   puts "message was sent!"
  # end

  get '/decision' do
    erb :index
  end

  get '/quiz' do
    erb :newindex
  end

  #get '/quiz' do
  #  erb :quiz
  #end

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
