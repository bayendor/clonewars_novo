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

# get '/:anything/' do |anything|
#   redirect "/#{anything}"
# end

get '/' do
  erb :home
end

get '/shop/?' do
  @african_products = DatabaseReader.new(:products).select_all_by_region("Africa")
  @central_am_products = DatabaseReader.new(:products).select_all_by_region("Central America")
  @south_am_products = DatabaseReader.new(:products).select_all_by_region("South America")
  @pacific_products = DatabaseReader.new(:products).select_all_by_region("Pacific")
	erb :shop
end

get '/:id/detail/?' do |id|
  @idea = DatabaseReader.new(:products).select_by_type(id.to_i)
	erb :detail
end

get '/admin/?' do
  protected!
  @products = DatabaseReader.new(:products).select_all
  erb :admin
end

get '/:id/edit/?' do |id|
  @idea = DatabaseReader.new(:products).select_by_type(id.to_i)
  erb :edit_product
end

get '/contact-locations/?' do
  erb :contact
end

get '/about/?' do
  erb :about
end

get '/wholesale/?' do
  erb :wholesale
end

get '/my-account/?' do
  erb :my_account
end

get '/lost-password/?' do
  erb :lost_password
end

not_found do
  erb :not_found
end

get '/news-events/?' do
  erb :news
end

# private

def protected!
  return if authorized?
  headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
  halt 401, "Not authorized\n"
end

def authorized?
  @auth ||= Rack::Auth::Basic::Request.new(request.env)
  @auth.provided? && @auth.basic? &&
  @auth.credentials && @auth.credentials == ['novo', 'c0ff33']
end
