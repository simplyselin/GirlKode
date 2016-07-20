require 'bundler'
Bundler.require

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/quiz' do
    erb :quiz 
  end


end
