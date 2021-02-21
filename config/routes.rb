Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks',
             registrations: "users/registrations",
             sessions: "users/sessions"}

  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
end
