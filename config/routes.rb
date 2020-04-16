Rails.application.routes.draw do
  root to: 'pictures#index'
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  resources :users, only: [:show, :new, :create, :edit, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  resources :relationships, only: [:create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :conversations do
    resources :messages
  end
end
