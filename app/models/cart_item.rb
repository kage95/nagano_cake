class CartItem < ApplicationRecord
  validates :amount, presence: true
  belongs_to :customer
  belongs_to :item
  validates :amount,presence: true
  
  def subtotal
    item.with_tax_price*amount
  end
  
  
end
