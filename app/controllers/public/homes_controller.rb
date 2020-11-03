class Public::HomesController < ApplicationController
  def top
    @random = Item.order("RANDOM()").limit(3)
    @genres = Genre.all
  end

  def about
  end
end
