class Public::HomesController < ApplicationController
  def top
    @random = Item.order("RANDOM()").limit(4)
    @item = Item.find(params[:id])
    @genres = Genres.all
  end

  def about
  end
end
