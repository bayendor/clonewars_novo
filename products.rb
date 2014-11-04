require 'sequel'

DB = Sequel.sqlite('db/novocoffee.db')

products = DB[:products]

puts "Product count: #{products.count}"

puts "The average price is #{products.avg(:price)/100}"
