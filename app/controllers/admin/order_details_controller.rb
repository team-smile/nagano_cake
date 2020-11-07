class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order_detail)
    else
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @sum = 0
      @order_details.each do |order_detail|
      @sum += order_detail.price*order_detail.amount
    end
      render "orders/show"
    end
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
