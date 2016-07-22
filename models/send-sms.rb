require 'rubygems'
require 'twilio-ruby'

 # Your Twilio number

def sendmessage(from, to, body)
  account_sid = "AC8fe5a4d8ba301c6efafaf71b70c00b42"
  auth_token = "bfb8e8e3255f2a67ec5ed5c0469413d3"
  client = Twilio::REST::Client.new account_sid, auth_token
  client.account.messages.create(
    :from => from,
    :to => to,
    :body => body
  )
  puts "Message was sent"
end
