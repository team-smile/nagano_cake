class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "制作中"
        @order = @order_detail.order
        @order.update(status:"制作中")
        redirect_to admin_order_path(@order)
      elsif @order_detail.making_status == "制作完了"
        @order = @order_detail.order
        if @order.order_details.all?{|m| m.making_status =="制作完了"}
          @order.update(status:"発送準備中")
          redirect_to admin_order_path(@order)
        end
      else
       @order = @order_detail.order
       redirect_to admin_order_path(@order)
      end
    else
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @sum = 0
      @order_details.each do |order_detail|
        @sum += order_detail.price*order_detail.amount
      end
      render "orders/index"
    end
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
