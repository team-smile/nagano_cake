class Public::CartItemsController < ApplicationController
 
  
  def update
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_cart
  end

  def index
    @cart_items = CartItems.al
  end


  def create
    @cart_item = current_user.cart_items.build(cart_item_params)
    @cart_items = current_user.cart_items.all
    if cart_item.item_id == @cart_item.item_id
      new_amount = cart_item.amount + @cart_item.amount
      cart_item.update_attribute(:amount, new_amount)
      @cart_item.delete
    end
  end
    @cart_item.save
    redirect_to :cart_items

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
  end
end
