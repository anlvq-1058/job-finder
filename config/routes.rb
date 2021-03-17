Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks',
             registrations: "users/registrations",
             sessions: "users/sessions"}

  root to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'

  namespace :admin do
    root to: "dash_broads#index"
    resources :dash_broads, only: :index
    resources :companies, except: %i(destroy index)
    devise_for :users, path: "", only: :sessions, controllers: {
        sessions: "admin/sessions"}
  end
end
