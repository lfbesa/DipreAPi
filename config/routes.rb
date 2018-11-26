Rails.application.routes.draw do
  resources :contacts
  resources :news
  resources :events
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :contacts
      resources :news
      resources :events
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
