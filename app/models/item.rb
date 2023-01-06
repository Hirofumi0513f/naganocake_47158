class Item < ApplicationRecord
  # itemモデルにitem_photo(商品画像)を持たせる
  has_one_attached :item_photo

  belongs_to :genre
  # has_many   :cart_items  , dependent: :destory
  # has_many   :order_detils, dependent: :destory
end
