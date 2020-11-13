class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id


    @cart = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @cart.present?
      cart_amount = @cart.amount + params[:cart_item][:amount].to_i
      @cart.update(amount: cart_amount)
    else
      @cart_item.save
    end
    redirect_to :cart_items
  end

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    # 初期値を指定する（数字であることを表すため）
    @sum = 0
    @rate = 1.1
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    redirect_to :cart_items
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :cart_items, notice: "商品をカートから削除しました。"
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
end