class Public::ItemsController < ApplicationController

  def index
    # @items = Item.page(params[:page]).per(9)
    @genres = Genre.where(is_active: true)
    @items = []
    @genres.each do |genre|
      genre.items.each do |item|
        # if item.is_active == true
          @items.push(item)
        # end
      end
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(is_active: true)
    @rate = 1.1
  end
end
