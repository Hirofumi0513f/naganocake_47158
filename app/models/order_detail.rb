class OrderDetail < ApplicationRecord
  enum is_active: { cannot_start: 0, waiting_for_production: 1, production: 2, production_finished:3}
  
  belongs_to :order
  belongs_to :item
end
