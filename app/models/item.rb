class Item < ApplicationRecord
  # itemモデルにimageを持たせる
  has_one_attached :image

  belongs_to :genre
  # has_many   :cart_items  , dependent: :destory
  # has_many   :order_detils, dependent: :destory
end
