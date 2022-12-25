require 'pry'

### basic sales 10% expect food, books, medical products
### import sales 5% no exceptions

# Development process:

## parse inputs
# -> Read file
# -> create data structure

## calculate taxes
## generate invoice

data = File.readlines('purchase_input.txt')

data.shift # removing first line
food_items = File.readlines('food_list.txt')
medical_items = File.readlines('medical_items_list.txt')
exempt_items = food_items + medical_items + ['book']

def calculate_taxes(item_name, item_price, exempt_items)
  item_taxes = item_price * 0.1

  # import validation
  item_taxes += item_price * 0.05 if item_name.match('imported')

  # exempt validation
  exempt_items.each do |item|
    item_taxes -= item_price * 0.1 if item_name.match(item)
  end
  # exempt validation

  # get numbers after decimal point
  floating_number = item_taxes.to_s.split('.').last
  floating_number = floating_number[0..1].to_i

  adjustment_tax = 5 - (floating_number % 5) if (floating_number % 5) != 0

  (item_taxes + adjustment_tax.to_f / 100).truncate(2)
end

total_taxes = 0
sales_total = 0

data.each do |line|
  line = line.split(' ')
  number_of_items = line.shift.to_i
  item_price = line.pop.to_f
  line.pop
  item_name = line.join(' ')

  item_taxes = calculate_taxes(item_name, item_price, exempt_items)
  total_taxes += (item_taxes * number_of_items)
  total_item_price = (item_price + item_taxes) * number_of_items
  sales_total += total_item_price

  puts "#{number_of_items} #{item_name}: #{total_item_price.truncate(2)}"
end

puts "Sales Taxes: #{total_taxes.round(2)}"
puts "Total: #{sales_total}"
