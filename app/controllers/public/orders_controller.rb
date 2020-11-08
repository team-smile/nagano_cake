class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(
      postal_code: params[:order][:postal_code],
      customer_id: current_customer.id,
      address: params[:order][:address],
      name: params[:order][:name],
      postage: params[:order][:postage],
      total_payment: params[:order][:total_payment],
      payment_method: params[:order][:payment_method],
      status: params[:order][:status])
    @order.save
    redirect_to "complete"
  end


  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @sum = 0
    @postage = 800

    if params[:order][:order] == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    elsif params[:order][:order] == "1"
      @address = Address.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def complete
  end

  def index
    @customer = current_customer
    @orders = @customer.orders.all
  end

  def show
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @sum = 0
    @postage = 800
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :customer_id, :address, :name, :postage, :total_payment, :payment_method, :status)
  end

end
