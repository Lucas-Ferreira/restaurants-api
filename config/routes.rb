Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "reviews", to: "reviews#index"
      resources :restaurants, only: [ :index, :show, :update] do
        get "show", to: "reviews#show"
      end
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
    end
  end
end
