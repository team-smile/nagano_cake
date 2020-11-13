class Admin::HomesController < ApplicationController
  
  before_action :authenticate_admin!
  
  def top
    @order = Order.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).count
  end
end
