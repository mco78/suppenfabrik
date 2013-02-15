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

  #resources :sales

  #match 'products', :to => 'products#index'

  #löschen?
  #match 'sales', :to => 'sales#index'

  match '/timetracking', :to => 'shifts#timetracking'

  resources :checkouts do
      resources :sales
      resources :z_bons
      resources :receipts do
        collection do
          get :add_new
        end
      end
      resources :cash_balances
  end

  match '/sales', :to => 'sales#admin_index'
  match '/z_bons', :to => 'z_bons#admin_index'
  match '/receipts', :to => 'receipts#admin_index'
  match '/cash_balances', :to => 'cash_balances#admin_index'

  mount Foundation::Icons::Rails::Engine => '/fi'
end
