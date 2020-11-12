class Public::EndUsersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
  	   redirect_to end_users_my_page_path(@customer.id), notice: "You have updated customer successfully."
    else
      render :edit
    end
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
  def customer_params
  	  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telphone_number)
  end
  
  def deleted_params
    params.require(:customer).permit(:is_deleted)
  end
  
end
