require_relative '../lib/taxes_calculator'

RSpec.describe TaxesCalculator do
  describe '#call' do
    subject { TaxesCalculator.call(item_name, item_price) }

    context 'when item is not imported and is not on exempt items' do
      let(:item_name) { 'music CD' }
      let(:item_price) { 14.99 }

      it 'calculate the tax' do
        expect(subject).to eq(1.5)
      end
    end

    context 'when item is not imported and is on exempt items' do
      let(:item_name) { 'book' }
      let(:item_price) { 12.49 }

      it 'calculate the tax' do
        expect(subject).to eq(0)
      end
    end

    context 'when item is imported and is not on exempt items' do
      let(:item_name) { 'imported bottle of perfume' }
      let(:item_price) { 27.99 }

      it 'calculate the tax' do
        expect(subject).to eq(4.2)
      end
    end

    context 'when item is imported and is on exempt items' do
      let(:item_name) { 'imported box of chocolates' }
      let(:item_price) { 10.00 }

      it 'calculate the tax' do
        expect(subject).to eq(0.5)
      end
    end
  end
end
