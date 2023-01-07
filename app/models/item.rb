class Item < ApplicationRecord
  # itemモデルにimage(商品画像)を持たせる
  has_one_attached :image

  belongs_to :genre
  # has_many   :cart_items  , dependent: :destory
  # has_many   :order_detils, dependent: :destory

  validates :name,         presence: true
  validates :introduction, presence: true
  validates :price,        presence: true
end
