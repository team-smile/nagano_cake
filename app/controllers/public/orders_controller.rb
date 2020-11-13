class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def create
    @rate = 1.1

    @order = Order.new(
      postal_code: params[:order][:postal_code],
      customer_id: current_customer.id,
      address: params[:order][:address],
      name: params[:order][:name],
      postage: params[:order][:postage],
      total_payment: params[:order][:total_payment],
      payment_method: params[:order][:payment_method]
      )
    @order.save

    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price * @rate
        @order_details.amount = cart_item.amount
        @order_details.save
        current_customer.cart_items.destroy_all
      end
    redirect_to orders_complete_path
  end


  def confirm

    @order = Order.new(order_params)
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @addresses = current_customer.addresses
    @sum = 0
    @rate = 1.1
    @order.postage = 800

    if params[:order][:order] == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    elsif params[:order][:order] == "1"
      @address = Address.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:order] == "2"
      new_address = Address.new
      new_address.customer_id = current_customer.id
      new_address.name = @order.name
      new_address.postal_code = @order.postal_code
      new_address.address = @order.address
      new_address.save
    else
      render "confirm"
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
    @sum = 0
    @postage = 800
    @rate = 1.1
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :customer_id, :address, :name, :postage, :total_payment, :payment_method, :status)
  end

end
