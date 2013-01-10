Suppenfabrik::Application.routes.draw do
  
  resources :daily_sales

  resources :stores

  root :to => "home#index"
  
  devise_for :users

  resources :shifts do
  	collection do
    	post 'start'
      get 'stop'
      get 'confirm_start'
  	end
  end

  resources :users do
    member do
      get :change_password
      put :update_password
    end
  end

  resources :stores

  resources :products

  match 'products', :to => 'products#index'

  match '/timetracking', :to => 'shifts#timetracking'

end
