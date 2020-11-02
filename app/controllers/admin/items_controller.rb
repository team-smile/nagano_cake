class Admin::ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
  end

  def create
    # item = Item.new(item_params)
    # item.save
    # redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end

  # private
  # def item_params
  #   require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  # end
end
