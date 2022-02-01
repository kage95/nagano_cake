class Admin::OrderDetailsController < ApplicationController
  
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    if order_detail.making_status == "making"
      order_detail.order.update(order_status: "making")
    elsif order_detail.making_status == "complete"
      order_detail.order.update(order_status: "preparation")
    end
    order_detail.save
    redirect_to admin_order_path(order_detail.order.id)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
