class Address < ApplicationRecord
  belongs_to :customer
  
  def addresses_display
    '〒'+postal_code+''+address+''+name
  end
end
