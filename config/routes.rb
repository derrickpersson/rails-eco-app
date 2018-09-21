Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  namespace :Api do
    namespace :V1 do
      resources :users, only: [:index, :create], controller: '/api/v1/users'
    end
  end
end
