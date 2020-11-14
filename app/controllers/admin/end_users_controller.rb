class Admin::EndUsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @end_users = Customer.page(params[:page]).order("id ASC")
  end

  def show
    @end_user = Customer.find(params[:id])
  end

  def edit
    @end_user = Customer.find(params[:id])
  end

  def update
    @end_user = Customer.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admin_end_user_path(@end_user)
    else
      render "edit"
    end
  end
  
  private
  def end_user_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
    :first_name_kana, :postal_code, :address, :telphone_number, :email, :is_deleted)
  end
end
