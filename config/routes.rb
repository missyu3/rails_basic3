Rails.application.routes.draw do

  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  resources :pictures do
    collection do
      post :confirm
    end
  end

end
