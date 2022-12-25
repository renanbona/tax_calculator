require 'pry'
require './invoice_reader'

invoice_reader = InvoiceReader.new('purchase_input.txt')
invoice_reader.call

puts "Sales Taxes: #{invoice_reader.total_taxes.round(2)}"
puts "Total: #{invoice_reader.total_sales}"
