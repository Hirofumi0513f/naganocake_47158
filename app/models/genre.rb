class Genre < ApplicationRecord
  enum name: { cake: 0, pudding: 1, baked_goods: 2, candy: 3}

  has_many :items, dependent: :destroy
end
