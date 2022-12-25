require 'pry'

### basic sales 10% expect food, books, medical products
### import sales 5% no exceptions

# Development process:

## parse inputs
# -> Read file
# -> create data structure

## calculate taxes
## generate invoice

data = File.readlines('purchase_input_3.txt')

data.shift # removing first line
food_items = File.readlines('food_list.txt')
medical_items = File.readlines('medical_items_list.txt')
exempt_items = food_items + medical_items + ['book']

def calculate_taxes(item_name, number_of_items, item_price, exempt_items)
  item_taxes = item_price * 0.1

  # import validation
  item_taxes += item_price * 0.05 if item_name.match('imported')

  # exempt validation
  exempt_items.each do |item|
    item_taxes -= item_price * 0.1 if item_name.match(item)
  end
  # exempt validation

  item_taxes * number_of_items
end

total_taxes = 0

data.each do |line|
  line = line.split(' ')
  number_of_items = line.shift.to_i
  item_price = line.pop.to_f
  line.pop
  item_name = line.join(' ')

  item_taxes = calculate_taxes(item_name, number_of_items, item_price, exempt_items)
  total_taxes += item_taxes
  total_item_price = (item_price * number_of_items) + item_taxes

  puts "#{number_of_items} #{item_name}: #{total_item_price.round(2)}"
end

puts "Sales Taxes: #{total_taxes.round(2)}"
