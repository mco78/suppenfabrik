Suppenfabrik::Application.routes.draw do
  
  resources :daily_sales

  resources :stores

  root :to => "home#index"
  
  devise_for :users

  resources :shifts do
  	# member do
  	# 	get 'stop'
  	# end

  	collection do
    	post 'start'
      get 'stop'
      get 'confirm_start'
  	end
  end

  resources :users

  resources :stores

  match 'sales', :to => 'sales#index'


  match '/timetracking', :to => 'shifts#timetracking'

end
