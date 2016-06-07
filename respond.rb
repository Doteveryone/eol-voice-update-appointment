require 'sinatra'
require 'dotenv'
require 'twilio-ruby'

Dotenv.load

set :logging, true


get '/' do
  content_type 'text/xml'

  Twilio::TwiML::Response.new do |r|
    r.Say 'What do you want to do?'
  end.text
end
