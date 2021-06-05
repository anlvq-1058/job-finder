Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks',
             registrations: "users/registrations",
             sessions: "users/sessions"}

  root to: 'static_pages#home'
  resources :resumes
  resources :jobs, only: :show do
    member do
      resources :apply_jobs, only: :create
    end
  end
  resources :active_users, only: :update
  resources :inactive_users, only: :update
  resources :public_resumes, only: :update
  resources :private_resumes, only: :update
  get '/contact', to: 'static_pages#contact'

  namespace :admin do
    root to: "dash_broads#index"
    resources :dash_broads, only: :index
    resources :companies, except: %i(destroy index)
    resources :jobs
    resources :resumes, only: :show
    resources :apply_resumes, only: %i(update destroy)
    devise_for :users, path: "", only: :sessions, controllers: {
        sessions: "admin/sessions"}
  end
end
