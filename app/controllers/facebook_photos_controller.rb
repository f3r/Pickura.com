class FacebookPhotosController < ApplicationController
  def index
    @albums = Facebook.albums(current_user)

    if params[:album_id]
      @album = @albums.find{|a| a.identifier == params[:album_id]}
    end

    unless @album
      @album = @albums.first
    end

    @photos = @album.photos
  end
end
