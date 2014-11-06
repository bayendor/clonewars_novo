require 'sinatra'
require 'sinatra/reloader' if development?
require 'sequel'
require_relative 'database_reader'
require_relative 'novo_helpers'

configure :development do
  DB = Sequel.sqlite('db/novocoffee.db')
  PRODUCTS = DatabaseReader.new(:products)
end

configure :test do
  DB = Sequel.sqlite('db/test.db')
  PRODUCTS = DatabaseReader.new(:products)
end

configure :production do
  DB = Sequel.connect(ENV['DATABASE_URL'])
  PRODUCTS = DatabaseReader.new(:products)
end

helpers NovoHelpers

before do
  @products             = find_products
  @african_products     = find_african_products
  @central_am_products  = find_central_am_products
  @south_am_products    = find_south_am_products
  @pacific_products     = find_pacific_products
  @alternative_products = find_alternative_products
  @accessories          = find_accessories
end

get '/' do
  @featured_products = PRODUCTS.random(3)
  erb :home
end

get '/shop/?' do
	erb :shop
end

get '/:id/detail/?' do |id|
  @product = find_by_id(id)
  @featured_products = PRODUCTS.random(3)
	erb :detail
end

get '/admin/?' do
  protected!
  erb :admin
end

get '/:id/edit/?' do |id|
  protected!
  @product = find_by_id(id)
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

get '/team/?' do
  erb :team
end

put '/:id/edit-product/?' do |id|
  protected!
  update_product(id, params['product'])
  redirect '/admin'
end

delete '/:id/?' do |id|
  protected!
  delete_product(id)
  redirect '/admin'
end

get '/subscriptions/?' do
  @subscriptions = find_subscriptions
  erb :subscriptions
end

get '/add_product/?' do
  protected!
  erb :add_product
end

post '/add_product/?' do
  PRODUCTS.add(params['product'])
  redirect '/admin'
end

get '/sign-up-for-a-cupping/?' do
  erb :cupping
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
