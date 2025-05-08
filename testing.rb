require_relative 'product'
require_relative 'delivery'
require_relative 'offers'
require_relative 'basket'

Product.add_product(Product.new(code: 'R01', name: 'Red Widget', price: 32.95))
Product.add_product(Product.new(code: 'G01', name: 'Green Widget', price: 24.95))
Product.add_product(Product.new(code: 'B01', name: 'Blue Widget', price: 7.95))


delivery_rules = [
  Delivery::Rule.new(min: 90, cost: 0),
  Delivery::Rule.new(min: 50, cost: 2.95),
  Delivery::Rule.new(min: 0, cost: 4.95)
]

offers = [Offers::RedWidget.new]

delivery_calculator = Delivery::Calculator.new(delivery_rules)
offer_applicator = Offers::Applicator.new(offers)

basket = Basket.new(Product, delivery_calculator, offer_applicator)

basket.add_items(['B01', 'G01'])
puts "Total: #{basket.total}"
basket.clear_items

basket.add_items(['R01', 'R01'])
puts "Total: #{basket.total}"
basket.clear_items

basket.add_items(['R01', 'G01'])
puts "Total: #{basket.total}"
basket.clear_items

basket.add_items(['B01','B01','R01', 'R01', 'R01'])
puts "Total: #{basket.total}"
basket.clear_items

basket.add_items(['B01','B01','R01', 'R01', 'R01', 'RO1'])
basket.remove_items(['B01'])
basket.remove_items(['G01'])
puts "Total: #{basket.total}"

basket.clear_items
basket.remove_items(['B01'])
basket.remove_items([''])
basket.remove_items([])
basket.add_items([])
basket.add_items([''])
puts "Total: #{basket.total}"
