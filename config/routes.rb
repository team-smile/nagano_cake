Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: :all

  devise_scope :customer do
    get 'end_users/sign_up' => 'public/registrations#new'
    post 'end_users' => 'public/registrations#create'
    get 'end_users/sign_in' => 'public/sessions#new'
    post 'end_users/sign_in' => 'public/sessions#create'
    delete 'end_users/sign_out' => 'public/sessions#destroy'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    resources :genres
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
    get "admin" => "admin#homes"
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :end_users, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update] do
      patch "order_details/:id" => "order_details#update"
    end
  end
end
