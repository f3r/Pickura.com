Covers::Application.routes.draw do
  resources :photos do
    member do
      post :watermark
    end
  end
  
  resources :pictures
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  match 'canvas' => 'home#editor'
  root :to => 'home#index'
end
