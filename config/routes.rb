Rails.application.routes.draw do



  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "register/create", to: "registers#create"
  get "/managercourses", to: "courses#index_manager"
  get "/managerregisters", to: "registers#index"
  get "/managerposts", to: "posts#index_manager"
  resources :users
  resources :posts
  resources :registers
  resources :courses
end
