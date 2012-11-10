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
  	end
  end

  resources :users

  resources :stores


  match '/timetracking', :to => 'shifts#timetracking'

end
