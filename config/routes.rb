Rails.application.routes.draw do



  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/courses", to: "courses#index"
  post "register/create", to: "registers#create"
  post "choices/create"
  post "choices/destroy"
  get   "quizt", to:  "quiz#index"

  post "quiz/start"

  get "quiz/question"

  post "quiz/question"

  post "quiz/answer"

  get "quiz/end"
  resources :users
  resources :posts
  resources :registers
  resources :questions
end
