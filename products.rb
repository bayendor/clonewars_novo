require 'sequel'

# DB = Sequel.connect('postgres://localhost/novocoffee')

products = DB[:products]

puts "Product count: #{products.count}"

puts "The average price is #{products.avg(:price)/100}"
