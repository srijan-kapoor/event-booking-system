Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :event_organizers, only: [:create] do
    collection do
      post 'login'
    end
  end

  resources :customers, only: [:create] do
    collection do
      post 'login'
    end
  end

  resources :events
end
