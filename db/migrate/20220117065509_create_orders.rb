class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,null:false
      t.string :shipping_postal,null:false
      t.string :shipping_address,null:false
      t.string :shipping_name,null:false
      t.integer :order_status,default:1
      t.integer :postage,default:"800"
      t.integer :total_payment,null:false
      t.integer :payment_method,default:1

      t.timestamps
    end
  end
end
