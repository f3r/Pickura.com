Covers::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :photos do
    member do
      post :watermark
    end
  end

  match 'gallery(/:tags)' => 'photos#gallery', :as => :gallery

  match 'cover/:id/download' => 'editor#download', :as => :download_cover
  match 'cover/:id/upload' => 'editor#upload', :as => :upload_cover

  match 'editor/:id' => 'editor#show', :as => :editor

  root :to => 'home#index'
end
