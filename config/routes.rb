Rails.application.routes.draw do
  devise_for :haunts
  mount ActionCable.server => '/cable'

  resources :conversations, only: [:show]
  resources :haunts, only: [] do
    member do
      get :conversation
    end
  end

  root to:'hangers#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
