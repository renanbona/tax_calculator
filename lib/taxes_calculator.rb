### basic sales 10% expect food, books, medical products
### import sales 5% no exceptions

class TaxesCalculator
  FOOD_ITEMS = File.readlines('./fixtures/food_list.txt')
  MEDICAL_ITEMS = File.readlines('./fixtures/medical_items_list.txt')

  def self.call(item_name, item_price)
    item_taxes = item_price * 0.1

    # import validation
    item_taxes += item_price * 0.05 if item_name.match('imported')

    # exempt validation
    exempt_items.each do |item|
      item_taxes -= item_price * 0.1 if item_name.match(item)
    end

    # get numbers after decimal point
    floating_number = item_taxes.to_s.split('.').last
    floating_number = floating_number[0..1].to_i

    adjustment_tax = 5 - (floating_number % 5) if (floating_number % 5) != 0

    (item_taxes + adjustment_tax.to_f / 100).truncate(2)
  end

  def self.exempt_items
    FOOD_ITEMS + MEDICAL_ITEMS + ['book']
  end
end
