Rails.application.routes.draw do



 root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/tao', to: 'posts#cre'
  post '/tao', to: 'posts#create'
  resources :users
  resources :posts, only: [:create, :destroy]
end
