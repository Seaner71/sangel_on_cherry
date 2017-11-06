ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'  # <-- your sinatra app
require 'rspec'
require 'sinatra'
require 'rack/test'

describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says Sangel" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Sangel')
  end
  it "links to menu" do
    get '/menu'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Java')
  end
  it "links to contact/reservations" do
    get '/contact'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Name')
  end
end
