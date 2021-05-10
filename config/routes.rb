Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'



  namespace :api do
    namespace :v1 do
      resource :users, only: [:create]
      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"

      resources :articles do
        resources :comments
      end
    end
  end

  resources :articles do
    resources :comments
  end

  # resources :articles do
  #   resources :comments
  # end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
