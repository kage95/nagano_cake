class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.page(params[:page]).order(id: "desc").per(8)
  end
end
