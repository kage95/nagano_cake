class OrderDetail < ApplicationRecord
  enum making_status: {not_startable:0,waiting:1,making:2,complete:3}
  belongs_to :order
  belongs_to :item
end
