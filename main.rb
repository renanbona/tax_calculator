### basic sales 10% expect food, books, medical products
### import sales 5% no exceptions

# Development process:

## parse inputs
# -> Read file
# -> create data structure

## calculate taxes
## generate invoice

data = File.readlines('purchase_input.txt')
food_items = File.readlines('food_list.txt')
medical_items = File.readlines('medical_items_list.txt')

data.shift # removing first line

data.each do |line|
  line = line.split(' ')
  number_of_items = line.shift
  item_price = line.pop
  line.pop
  item_name = line.join(' ')

  print "o numero de items: #{number_of_items} "
  puts "Preço por item: #{item_price}"
  puts item_name
end
