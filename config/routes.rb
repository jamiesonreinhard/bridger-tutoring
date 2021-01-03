Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :students, only: [ :index, :show, :update, :create ]
      resources :tutors, only: [ :index, :show, :update, :create ]
      resources :partners, only: [ :index, :create ]
      resources :appointments, only: [ :index, :show, :update, :create, :destroy ]
      resources :subjects, only: [:index, :create, :destroy]
      resources :users, only: [ :show ]
    end
  end
end
