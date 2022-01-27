class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.shipping_postal = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      address = Address.find(params[:order][:address_id])
      @order.shipping_address = address.address
      @order.shipping_postal = address.postal_code
      @order.shipping_name = address.name
    end
    @order.postage = 800
    @order.total_payment = current_customer.cart_items.inject(@order.postage) { |sum, item| sum + item.subtotal }
  end
  
  def create
    @order.save
    redirect_to root_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method,:shipping_address,:shipping_postal,:shipping_name,:total_payment,:postage)
  end
end
