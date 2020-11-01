class Public::HomesController < ApplicationController
  def top
    @random = Item.order("RANDOM()").limit(4)
  end

  def about
  end
end
