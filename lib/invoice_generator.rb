require_relative './invoice_reader'

class InvoiceGenerator
  INVOICES = %w[purchase_input purchase_input_2 purchase_input_3].freeze

  def self.call
    INVOICES.each do |invoice_name|
      invoice_reader = InvoiceReader.new("fixtures/#{invoice_name}.txt")
      invoice_reader.call

      puts "Sales Taxes: #{format('%.2f', invoice_reader.total_taxes)}"
      puts "Total: #{invoice_reader.total_sales}"
      puts ''
    end
  end
end

InvoiceGenerator.call
