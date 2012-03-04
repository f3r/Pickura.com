Covers::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :photos do
    member do
      post :watermark
    end
  end

  match 'gallery/:id-:slug'   => 'covers#show',         :as => :gallery_show
  match 'gallery(/:tags)'     => 'covers#index',        :as => :gallery
  match 'cover/:id/download'  => 'editor#download',     :as => :download_cover
  match 'cover/:id/upload'    => 'editor#upload',       :as => :upload_cover
  match 'editor/:id'          => 'editor#show',         :as => :editor
  #match 's/:id'              => 'photos'

  root :to => 'home#index'
end
