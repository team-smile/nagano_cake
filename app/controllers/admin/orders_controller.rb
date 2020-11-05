class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    # @order_detail = OrderDetail.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      @orders = Order.all
      render "show"
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
