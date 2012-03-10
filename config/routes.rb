Covers::Application.routes.draw do
  # Redirect http://pickura.com to http://www.pickura.com
  constraints(:host => /^pickura.com/) do
    root :to => redirect("http://www.pickura.com")
    match '/*path', :to => redirect {|params, req| "http://www.pickura.com/#{params[:path]}"}
  end

  match "/public/sitemap_index.xml.gz" => redirect("https://s3.amazonaws.com/pickura/sitemaps/sitemap_index.xml.gz"), :as => :sitemap_index


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :photos do
    member do
      post :watermark
    end
  end

  match 'categories(/:tags)'    => 'covers#index',          :as => :gallery
  match '/:id'                  => 'covers#show',           :as => :gallery_show, :constraints => lambda{|req| req["id"].include? "facebook-timeline-cover" }
  match 'gallery/:sharing_url'  => 'covers#sharing_url',    :as => :gallery_sharing_url
  match 'most-popular'          => 'covers#most_popular',   :as => :gallery_popular
  match 'editors-pick'          => 'covers#editor_pick',    :as => :gallery_editor_pick
  match 'cover/:id/download'    => 'editor#download',       :as => :download_cover
  match 'cover/:id/upload'      => 'editor#upload',         :as => :upload_cover
  match 'cover/premium'         => 'covers#premium'
  match 'editor/:id'            => 'editor#show',           :as => :editor
  match 'pick'                  => 'facebook_photos#index', :as => :photo_picker
  post  'subscribe'             => 'home#subscribe',        :as => :subscribe
  post  'unsubscribe'           => 'home#unsubscribe',      :as => :unsubscribe


  root :to => 'home#index'
end