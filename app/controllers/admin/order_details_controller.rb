class Admin::OrderDetailsController < ApplicationController
  
  def update
    order_detail = OrderDetail.find(params[:id])
    order = order_detail.order
    order_detail.update(order_detail_params)
    if order_detail.making_status == "making"
      order_detail.order.update(order_status: "making")
    elsif order.order_details.count  == order.order_details.where(making_status: "complete").count
      order.update(order_status: "preparation")
    end
    order_detail.save
    redirect_to admin_order_path(order_detail.order.id)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
