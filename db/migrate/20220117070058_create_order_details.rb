class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id,null:false
      t.integer :item_id,null:false
      t.integer :tax_inclouded_price,null:false
      t.integer :count,null:false
      t.integer :making_status,default: "1"

      t.timestamps
    end
  end
end
