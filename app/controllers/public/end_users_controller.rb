class Public::EndUsersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
    @customer = Customer.new
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(deleted_params)
    redirect_to root_path
  end
  
  private
  def deleted_params
    params.require(:customer).permit(:is_deleted)
  end
  
end
