require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
include SendGrid

get '/' do
  erb :index
end

get '/menu' do
  erb :menu
end

get '/contact' do
  erb :contact
end

post '/contact' do
  # binding.pry
  from = Email.new(email: 'test@example.com')
  to = Email.new(email: 'ssmyth1071@gmail.com')
  subject = 'Sending with SendGrid is Fun'
  content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end
