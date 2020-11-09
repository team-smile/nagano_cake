class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
    @order_details.each do |order_detail|
      @sum += order_detail.price*order_detail.amount
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @sum = 0
      @order_details.each do |order_detail|
        @sum += order_detail.price*order_detail.amount
      end
      render "show"
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
