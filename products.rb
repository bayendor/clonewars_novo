require 'sequel'

DB = Sequel.sqlite('db/products.db')

# DB.create_table :products do
#   primary_key :id
#   String :name
#   String :region
#   String :type
#   String :description
#   Float :price
#   String :image
#   String :sizes
# end

products = DB[:products]

# products.insert(name: 'Kiamwangi', region: 'Africa', type: 'regular', price: 20.00)
# products.insert(name: 'Belekatu', region: 'Africa', type: 'regular', price: 16.00)
# products.insert(name: 'Hartman Honey', region: 'Central America', type: 'regular', price: 15.00, image: 'HarmannHoney.png')
# products.insert(name: 'Four Leftys', region: '', type: 'blend', price: 13.50, image: 'blend-four-leftys.png')

puts "Product count: #{products.count}"

puts "The average price is #{products.avg(:price)}"
