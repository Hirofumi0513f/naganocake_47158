class Item < ApplicationRecord
  enum is_active: { on_sale: 0, sold_out: 1}

  belongs_to :genre
  has_many   :cart_items  , dependent: :destory
  has_many   :order_detils, dependent: :destory
end
