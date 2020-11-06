class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
    items_path(currnt_customer)
  end
  def after_sign_in_path_for(resource)
    items_path(current_customer)
  end

  helper_method :current_cart

  def current_cart
    if session[:cart_item_id]
      @cart_item = CartItem.find(session[:cart_item_id])
    else
      @cart_item = CartItem.create
      session[:cart_item_id] = @cart_item.id
    end
  end
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    
    end
  end
  
    protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :last_name,:first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telphone_number])
  end

end
