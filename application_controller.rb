require 'bundler'
Bundler.require
require_relative 'models/quizmodel.rb'
require_relative 'models/send-sms.rb'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness



class ApplicationController < Sinatra::Base


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
    @phonenumber = params[:phone]
    sendmessage("+12562700213", "+1#{@phonenumber}", "Hello, #{@decision}")
    erb :results
  end

  get '/results' do
    erb :results
  end

end
