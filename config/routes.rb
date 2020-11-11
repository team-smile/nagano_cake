Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers,
    path: 'end_users',
    controllers: {
      registrations: "public/registrations",
      sessions: "public/sessions",
      end_users: "public/end_users"
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    get "/end_users/my_page" => "end_users#show"
    get "end_users/unsubscribe" => "end_users#unsubscribe"
    patch "end_users/withdraw" => "end_users#withdraw"
    resources :end_users, only: [:edit, :update]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, except: [:show, :new, :edit]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, except: [:edit, :update, :destroy]
    resources :addresses, except: [:new, :show]
    resources :genres, only: [:show]
  end

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only: [:edit, :update, :create, :index]
    resources :end_users, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update] do
      patch "order_details/:id" => "order_details#update"
    end
  end

  get "admin" => "admin/homes#top"

end
