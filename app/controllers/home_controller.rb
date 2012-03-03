class HomeController < ApplicationController
  def index
    if user_signed_in?
      load_photos
      render 'index', :layout => 'sidebar'
    else
      redirect_to gallery_path
    end
  end

  def editor
  end
  
  protected
  
  def load_photos
    @photos = Photo.limit(10)
  end
end
