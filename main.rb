require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/shop' do 
	erb :shop
end
get '/contact-locations' do
  erb :contact
end
