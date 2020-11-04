class Public::OrdersController < ApplicationController

  def create
    @order = current_user.orders.new(order_params)
    @order.save
    @cart_items = current_user.cart_items.all
      @cart_items.each do |cart_item|
        @order_items = @order.cart_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.name = cart_item.item.name
        @order_items.price = cart_item.item.price
        @order_items.amount = cart_item.amount
        @order_items.save
        current_user.cart_items.destroy_all
      end
  end

  def new
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end
end
