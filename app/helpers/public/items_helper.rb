module Public::ItemsHelper

  def addTax(price, rate)
    taxed_price = (price*rate).round
    "¥#{taxed_price}(税込)"
  end

end
