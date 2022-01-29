class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.page(params[:page]).order(id: "desc").per(8)
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    order.save
    redirect_to admin_order_path(order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
  
end
