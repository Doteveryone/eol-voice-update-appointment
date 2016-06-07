require 'sinatra'
require 'dotenv'
require 'twilio-ruby'

Dotenv.load

set :logging, true


get '/' do
  content_type 'text/xml'

  lines = [
    'What do you want to do?',
    'Are you Lucy?',
    'What is your date of birth?',
    'You have two appointments booked. You have an appointment with the cardiologist and one with the dietician. Which one would you like to reschedule?',
    'Your cardiologist appointment with Dr Martin will be rescheduled. Will your daughter be bringing you to the appointment again?',
    'Looking at your daughter’s schedule, Dr Martin and your daughter are available on Tuesday at 4.30pm or Wednesday at 10am. Which one would you like to book?',
    'Tuesday at 4.30pm or Wednesday at 10am. Which one would you like to book?',
    'Thursday isn’t available. You can choose between Tuesday at 4.30pm or Wednesday at 10am. Which one would you like to book?',
    'OK. Your cardiology appointment has been rescheduled for Wednesday 10th July at 10am. Is there anything else?'
  ]

  Twilio::TwiML::Response.new do |r|
    lines.each { |line|
      r.Say line
      r.Pause length: 4
    }

  end.text
end
