require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/shop' do
	erb :shop
end

get '/shop/detail' do
	erb :detail
end

get '/contact-locations' do
  erb :contact
end

get '/about' do
  erb :about
end

get '/wholesale' do
  erb :wholesale
end
get '/my-account' do
  erb :my_account
end

get '/my-account/lost-password' do
  erb :lost_password
end

not_found do
  erb :not_found
end


