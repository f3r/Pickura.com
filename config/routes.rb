Covers::Application.routes.draw do
  # Redirect http://pickura.com to http://www.pickura.com
  constraints(:host => /^pickura.com/) do
    root :to => redirect("http://www.pickura.com")
    match '/*path', :to => redirect {|params, req| "http://www.pickura.com/#{params[:path]}"}
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :photos do
    member do
      post :watermark
    end
  end

  match 'most-popular'        => 'covers#most_popular',   :as => :gallery_popular
  match 'editors-pick'        => 'covers#editor_pick',    :as => :gallery_editor_pick
  match 'gallery/:id'         => 'covers#show',           :as => :gallery_show, :constraints => lambda{|req| req["id"].include? "facebook-timeline-cover" }
  match 'gallery/:id'         => 'covers#index',          :as => :gallery, :constraints => lambda{|req| !req["id"].include? "facebook-timeline-cover" }
  match 'cover/:id/download'  => 'editor#download',       :as => :download_cover
  match 'cover/:id/upload'    => 'editor#upload',         :as => :upload_cover
  match 'cover/premium'       => 'covers#premium'
  match 'editor/:id'          => 'editor#show',           :as => :editor
  match 'pick'                => 'facebook_photos#index', :as => :photo_picker

  root :to => 'home#index'
end
