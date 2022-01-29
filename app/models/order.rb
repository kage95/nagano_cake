class Order < ApplicationRecord
  enum payment_method: {credit_card:0,transfer:1}
  enum order_status: {waiting:0,confirmation:1,making:2,preparation:3,sent:4}
  belongs_to :customer
  has_many :order_details,dependent: :destroy
  
  def address_display
    "〒" + shipping_postal + " " + shipping_address + " " + shipping_name
  end
  
end
