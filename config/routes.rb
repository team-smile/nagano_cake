Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: :all

  devise_scope :customer do
    get 'end_users/sign_up' => 'customers/registrations#new'
    post 'end_users' => 'customers/registrations#create'
    get 'end_users/sign_in' => 'customers/sessions#new'
    post 'end_users/sign_in' => 'customers/sessions#create'
    delete 'end_users/sign_out' => 'customers/sessions#destroy'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    resources :end_users, only: [:show, :edit, :update]
    get "end_users/unsubscribe" => "end_users#unsubscribe"
    patch "end_users/withdraw" => "end_users#withdraw"
    resources :cart_items, except: [:show, :new, :edit]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders, except: [:edit, :update, :destroy]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :addresses, except: [:new, :show]
  end

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only: [:edit, :update, :create, :index]
    resources :end_users, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update] do
      resources :order_details , only: [:update]
    end
  end
  
  get "admin" => "admin/homes#top"
  
end
