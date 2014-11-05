require 'sinatra'
require 'sinatra/reloader' if development?
require 'sequel'
require_relative 'database_reader'

configure :development do
  DB = Sequel.sqlite('db/novocoffee.db')
end

# configure :development do
#   DB = Sequel.connect('postgres://localhost/novocoffee')
# end

configure :production do
  DB = Sequel.connect(ENV['DATABASE_URL'])
end

get '/:anything/' do |anything|
  redirect "/#{anything}"
end

get '/' do
  erb :home
end

get '/shop' do
	erb :shop
end

get '/product-detail' do
	erb :detail
end

get '/admin' do
  @products = DatabaseReader.new(:products).select_all
  erb :admin
end

get '/:id/edit' do |id|
  @idea = DatabaseReader.new(:products).select_by_type(id.to_i)
  erb :edit_product
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

get '/lost-password' do
  erb :lost_password
end

not_found do
  erb :not_found
end

get '/news-events/?' do
  erb :news
end
