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

helpers do
  def find_products
    DatabaseReader.new(:products).select_all
  end

  def find_african_products
    DatabaseReader.new(:products).select_all_by_region("Africa")
  end

  def find_central_am_products
    DatabaseReader.new(:products).select_all_by_region("Central America")
  end

  def find_south_am_products
    DatabaseReader.new(:products).select_all_by_region("South America")
  end

  def find_pacific_products
    DatabaseReader.new(:products).select_all_by_region("Pacific")
  end

  def find_alternative_products
    DatabaseReader.new(:products).select_all_by_that_are_not("regular")
  end

  def find_accessories
    DatabaseReader.new(:products).select_all_by_type("accessories")
  end
end

before do 
  @products             = find_products
  @african_products     = find_african_products
  @central_am_products  = find_central_am_products
  @south_am_products    = find_central_am_products
  @pacific_products     = find_pacific_products
  @alternative_products = find_alternative_products
  @accessories          = find_accessories
end

get '/' do
  erb :home
end

get '/shop/?' do
	erb :shop
end

get '/:id/detail/?' do |id|
  @product = DatabaseReader.new(:products).select_by_type(id.to_i)
	erb :detail
end

get '/admin/?' do
  protected!
  erb :admin
end

get '/:id/edit/?' do |id|
  @product = DatabaseReader.new(:products).select_by_type(id.to_i)
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
