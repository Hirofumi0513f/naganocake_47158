class Item < ApplicationRecord
  # itemモデルにimage(商品画像)を持たせる
  has_one_attached :image

  belongs_to :genre
  # has_many   :cart_items  , dependent: :destory
  # has_many   :order_detils, dependent: :destory

  # 消費税を加えた商品価格のメソッドｓ
  # round:小数点の切り上げを実施
  def add_tax_price
    (self.price * 1.1).round
  end

  def get_item_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name,         presence: true
  validates :introduction, presence: true
  validates :price,        presence: true
end
