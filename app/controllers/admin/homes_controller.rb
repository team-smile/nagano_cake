class Admin::HomesController < ApplicationController
  def top
    @order = Order.where(created_at: 1.day.ago.all_day)
  end
end
