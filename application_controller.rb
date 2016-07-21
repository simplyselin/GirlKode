require 'bundler'
Bundler.require
require_relative 'models/quizmodel.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
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
