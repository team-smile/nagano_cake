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
    @order.postage = 800
  end

  def update
    @order = Order.find(params[:id])
    binding.pry
    if @order.update(order_params)
      if @order.status == "入金確認"
        @order_detail = OrderDetail.find(15)
        @order_detail.update(making_status:"制作待ち")
        redirect_to admin_order_path(@order)
      elsif @order.status == "制作中"
        @orders = Order.where(order_id: @order.id)
        @orders.update(status:"制作中")
        redirect_to admin_order_path(@order)
      else
      redirect_to admin_order_path(@order)
      end
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
