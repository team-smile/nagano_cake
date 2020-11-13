class Public::HomesController < ApplicationController
  def top
    @genres = Genre.where(is_active: true)
    @items = Item.joins(:genre).where(genres: {is_active: true}, is_active: true)
    @randoms = @items.order("RANDOM()").limit(3)
  end

  def about
  end
end
