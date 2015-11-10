module PursuitsHelper
  def format_currency(price)
    number_to_currency(price, unit: "$")[0...-3]
  end
end
