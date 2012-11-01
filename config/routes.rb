Suppenfabrik::Application.routes.draw do
  
  resources :stores

  root :to => "home#index"
  
  devise_for :users

  resources :shifts do
  	member do
  		get 'stop'
  	end

  	collection do
    	get 'start'
  	end
  end

  resources :users

  resources :stores


  match '/timetracking', :to => 'shifts#timetracking'

end
