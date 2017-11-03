require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/menu' do
  erb :menu
end

get '/contact' do
  erb :contact
end
