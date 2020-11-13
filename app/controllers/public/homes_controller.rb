class Public::HomesController < ApplicationController
  def top
    # @random = Item.order("RANDOM()").limit(3)
    @genres = Genre.where(is_active: true)
    @items = []
    @genres.each do |genre|
      genre.items.each do |item|
        if item.is_active == true
          @items.push(item)
        end
      end
    end
  end

  def about
  end
end
