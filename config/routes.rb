Covers::Application.routes.draw do
  resources :images
  resources :pictures
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  match 'canvas' => 'home#editor'
  root :to => 'home#index'
end
