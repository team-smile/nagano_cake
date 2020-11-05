class Public::CartItemsController < ApplicationController
  # before_action :setup_cart_item!, only: [:create, :update, :destroy]

  def create
    @cart_item = CartItem.new(cart_item_params)
    # @cart_item.customer_id = current_customer.id
    @cart_item.customer_id = 1


    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update
    else
      @cart_item.save
    end
    redirect_to :cart_items, notice: 'カートに追加しました。'
  end

  def index
    @cart_items = CartItem.all
    # @cart_items = current_customer.cart_item
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to :cart_items
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :cart_items
  end

  def destroy_all
    @customer = current_customer
    @customer.cart_items.destroy_all
    redirect_to :cart_items, notice: "カートが空になりました。"
  end

  private

   def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
   end
  # def setup_cart_item!
  #   @cart_item = current_cart_item.find_by(item_id: params[:item_id])
  # end
end
