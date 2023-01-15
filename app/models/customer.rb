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

  # 名前（「姓」と「名」）のバリデーション/presenceヘルパーで入力必須にする
  validates :last_name, presence: true
  validates :first_name, presence: true

  # フリガナ（「セイ」と「メイ」）のバリデーション/presenceヘルパーで入力必須にする
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  # メールアドレスのバリデーション/presenceヘルパーで入力必須にする
  validates :email, presence: true

  # 郵便番号のバリデーション/presenceヘルパーで入力必須にする
  validates :postal_code, presence: true

  # 住所のバリデーション/presenceヘルパーで入力必須にする
  validates :address, presence: true

  # 電話番号のバリデーション/presenceヘルパーで入力必須にする
  validates :telephone_number, presence: true

  # 顧客側会員登録画面で使用するパスワードのバリデーション
  # confirmationヘルパー：２つのテキストフィールドで受け取る内容が完全一致するかを確認するためのヘルパー。
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
