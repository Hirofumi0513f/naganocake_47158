class Item < ApplicationRecord
  enum is_active: { on_sale: 0, sold_out: 1}
end
