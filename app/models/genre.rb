class Genre < ApplicationRecord
  enum name: { cake: 0, pudding: 1, baked_goods: 2, candy: 3}
end
