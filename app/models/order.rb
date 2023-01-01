class Order < ApplicationRecord
  enum payment: { credit_card: 0, transfer: 1}
  enum is_active: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent: }
end
