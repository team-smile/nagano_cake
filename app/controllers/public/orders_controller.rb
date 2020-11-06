class Public::OrdersController < ApplicationController

  # def create
  #   @order = current_customer.orders.new(order_params)
  #   @order.save
  #   @cart_items = current_customer.cart_items.all
  #     @cart_items.each do |cart_item|
  #       @order_items = @order.cart_items.new
  #       @order_items.item_id = cart_item.item.id
  #       @order_items.name = cart_item.item.name
  #       @order_items.price = cart_item.item.price
  #       @order_items.amount = cart_item.amount
  #       @order_items.save
  #       current_customer.cart_items.destroy_all
  #     end
  # end

  # def new
  #   @order = Order.new
  #   # @customer = current_customer
  # end

  # def confirm
  # end

  # def complete
  # end

  # def index
  #   @orders = current_customer.cart_item
  # end

  def show
  end
end
