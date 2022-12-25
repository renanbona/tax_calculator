require './invoice_reader'

class InvoiceGenerator
  INVOICES = %w(purchase_input purchase_input_2 purchase_input_3)

  def self.call
    INVOICES.each do |invoice_name|
      invoice_reader = InvoiceReader.new("#{invoice_name}.txt")
      invoice_reader.call

      puts "Sales Taxes: #{invoice_reader.total_taxes.round(2)}"
      puts "Total: #{invoice_reader.total_sales}"
      puts ''
    end
  end
end

InvoiceGenerator.call
