Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
end
