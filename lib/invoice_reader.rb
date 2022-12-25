require_relative './taxes_calculator'

class InvoiceReader
  attr_accessor :total_taxes, :total_sales, :items_data
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
    @total_taxes = 0
    @total_sales = 0
    @items_data = []
  end

  def call
    data = File.readlines(file_name)
    # remove unnecessary first line
    data.shift

    data.each do |line|
      line = line.split(' ')
      number_of_items = line.shift.to_i
      item_price = line.pop.to_f
      line.pop
      item_name = line.join(' ')

      item_taxes = TaxesCalculator.call(item_name, item_price)
      @total_taxes += (item_taxes * number_of_items)
      total_item_price = (item_price + item_taxes) * number_of_items
      @total_sales += total_item_price

      items_data << "#{number_of_items} #{item_name}: #{total_item_price.truncate(2)}"
      puts "#{number_of_items} #{item_name}: #{total_item_price.truncate(2)}"
    end

    items_data
  end
end
