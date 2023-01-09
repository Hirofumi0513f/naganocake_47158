class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders    , dependent: :destroy
  has_many :adresses  , dependent: :destroy

  # 会員氏名のフルネーム用定義
  def full_name
    self.last_name + self.first_name
  end

  # 会員フリガナフルネーム用の定義
  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end

  # 退会フラグ（is_deleted）のバリデーション設定
  validates :is_deleted, inclusion: {in: [true, false]}
end
