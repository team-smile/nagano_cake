class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    if @model == "customer"
      @records = Customer.search_for(@content)
    elsif @model == "item"
      @records = Item.search_for(@content)
    elsif @model == "order"
      @records = Order.search_for(@content)
    elsif @model == "genre"
      @records = Genre.search_for(@content)
    end
  end
end
