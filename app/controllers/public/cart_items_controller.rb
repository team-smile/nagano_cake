class Public::CartItemsController < ApplicationController
  before_action :authenticate_user!
  
  def update
  end

  def index
    @cart_items = CartItem.all
  end

  def create
  end

  def destroy
  end

  def destroy_all
  end
end
