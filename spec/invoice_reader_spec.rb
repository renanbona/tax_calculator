require_relative '../invoice_reader'

RSpec.describe InvoiceReader do
  describe '#call' do
    let(:file_name) { 'purchase_input.txt' }
    let(:formatted_data) { ['2 book: 24.98', '1 music CD: 16.49', '1 chocolate bar: 0.85'] }

    subject { InvoiceReader.new(file_name).call }

    it 'parses the item data' do
      expect(subject).to eq(formatted_data)
    end
  end
end
