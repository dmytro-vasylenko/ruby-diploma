Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :admins
      devise_scope :admin do
        resources :admins
        resources :sessions
        resources :institutions
      end

      resources :visitors
    end
  end
end
