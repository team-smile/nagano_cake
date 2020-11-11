module Public::ItemsHelper

  def addTax(price, rate)
    taxed_price = (price*rate).round.to_s(:delimited)
    "¥#{taxed_price}(税込)"
  end

end
