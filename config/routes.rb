Covers::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :photos do
    member do
      post :watermark
    end
  end

  match 'gallery' => 'photos#gallery', :as => :gallery

  resources :pictures

  match 'editor/:id' => 'editor#show', :as => :editor

  root :to => 'home#index'
end
