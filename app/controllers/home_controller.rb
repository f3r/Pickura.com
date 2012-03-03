class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to gallery_path
    else
      @photos = []
      (1..10).each {|i|
        @photos << "https://s3.amazonaws.com/pickura/static/branded#{i}.jpg"
      }
      render 'welcome'
    end
  end

  def editor
  end

  protected

  def load_photos
    @photos = Photo.limit(10)
  end
end
