Rails.application.routes.draw do
	
  get 'static_pages/home'

  get "/help", to: "static_pages#help"

  root 'static_pages#home'
end
