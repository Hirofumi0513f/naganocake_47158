class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders    , dependent: :destroy
  has_many :adresses  , dependent: :destroy

  def full_name
    self.first_name + self.last_name
  end

  # 退会フラグ（is_deleted）のバリデーション設定
  validates :is_deleted, inclusion: {in: [true, false]}
end
