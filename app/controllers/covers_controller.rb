class CoversController < ApplicationController
  def index
    @photos      = Photo.search(params[:page], params[:per_page], params[:tags])
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
  end

  def show
    @photo = Photo.find(params[:id])
    @tags  = Photo.relevant_tags
  end
end
