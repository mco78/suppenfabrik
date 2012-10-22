Suppenfabrik::Application.routes.draw do
  
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


  match '/timetracking', :to => 'shifts#timetracking'

end
