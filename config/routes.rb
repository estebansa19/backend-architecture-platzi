Rails.application.routes.draw do
  namespace :v1 do
    post 'authenticate', to: 'authentication#authenticate'
    resources :reviews, only: [:index, :create]
  end
end
