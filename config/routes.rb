Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home' # Controller#action

  get 'about' => 'pages#about', as: 'about' # Example of regular routes

  resources :posts do # auto generate the routes for posts resource. Run the 'rake routes' command to see the generated routes.
  		resources :comments
  end
end
