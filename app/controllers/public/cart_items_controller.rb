class Public::CartItemsController < ApplicationController
  before_action :authenticate_user!
  
  def update
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_cart
  end

  def index
    @cart_items = current_cart.cart_items
  end


  def create
    @cart_item = current_user.cart_items.build(cart_item_params)
    @cart_item.save
    redirect_to current_cart
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
  end
end
