class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.total_payment = @cart_items.inject(@order.postage) { |sum, item| sum + item.subtotal }
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
    session[:order] = @order
  end
  
  def create
    @order = Order.new(session[:order])
    @order.save
    session.delete(:order)
    redirect_to complete_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method,:shipping_address,:shipping_postal,:shipping_name,:total_payment,:postage,:customer_id)
  end
end
