class Public::CartItemsController < ApplicationController


    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_amount = @cart_item.amount + params[:cart_item][:amount].to_i
      @cart_item.update(amount: cart_amount)
    else
      @cart_item.save
    end
    redirect_to :cart_items, notice: 'カートに追加しました。'
  end

  def index
    @cart_items = CartItem.all
  end


  def create
    # @user = current_user

    # @oreder = Order.new
    # @order.user_id = current_user.id
    # @order.save!

    # @user.cart_items.each do |cart_item|

    @cart_item = current_user.cart_items.build(cart_item_params)
    @cart_items = current_user.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to :cart_items
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
    @user = current_user
    @user.cart_items.delete_all
  end
<<<<<<<<< saved version
    redirect_to current_cart
  end

  def destroy_all
    @user = current_user
    @user.cart_items.delete_all
  end
=========

  private

   def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
   end
  # def setup_cart_item!
  #   @cart_item = current_cart_item.find_by(item_id: params[:item_id])
  # end
>>>>>>>>> local version
end
