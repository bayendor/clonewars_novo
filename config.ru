require './main'

# Sequel.connect(ENV['DATABASE_URL']) || 'postgres://localhost/novocoffee')

run Sinatra::Application
