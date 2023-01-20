class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # カート内の商品合計に利用
  def sum_of_price
    item.price * quantity
  end
end
