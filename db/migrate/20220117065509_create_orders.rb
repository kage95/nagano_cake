class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :costomer_id,null:false
      t.string :shipping_portal,null:false
      t.string :shipping_address,null:false
      t.string :shipping_name,null:false
      t.boolean :order_status,default:"1"
      t.integer :postage,default:"800"
      t.integer :total_payment,null:false
      t.integer :payment_method,default:1

      t.timestamps
    end
  end
end
