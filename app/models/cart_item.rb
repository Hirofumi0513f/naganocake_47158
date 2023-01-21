class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

    # カート内の商品合計に利用
    # add_tax_priceについては、app/models/item.rbを参照
  def sum_of_price
    item.add_tax_price * amount
  end
end
