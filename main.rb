require 'sinatra'
require 'sinatra/reloader' if development?
require 'sequel'
require_relative 'database_reader'

configure :development do
  DB = Sequel.sqlite('db/novocoffee.db')
end

configure :production do
  DB = Sequel.connect(ENV['DATABASE_URL'])
end

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
    DatabaseReader.new(:products).select_all_by_that_are_not("regular", "accessories", "subscription")
  end

  def find_accessories
    DatabaseReader.new(:products).select_all_by_type("accessories")
  end

  def update_product(id, params)
    DatabaseReader.new(:products).update(id, params)
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
  @featured_products = DatabaseReader.new(:products).random(3)
  erb :home
end

get '/shop/?' do
	erb :shop
end

get '/:id/detail/?' do |id|
  @product = DatabaseReader.new(:products).select_by_id(id)
  @featured_products = DatabaseReader.new(:products).random(3)
	erb :detail
end

get '/admin/?' do
  protected!
  erb :admin
end

get '/:id/edit/?' do |id|
  protected!
  @product = DatabaseReader.new(:products).select_by_id(id)
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

put '/:id/edit-product/?' do |id|
  protected!
  update_product(id, params['product'])
  redirect '/admin'
end

get '/subscriptions/?' do 
  @subscriptions = DatabaseReader.new(:products).select_all_by_type("subscription")
  erb :subscriptions
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
