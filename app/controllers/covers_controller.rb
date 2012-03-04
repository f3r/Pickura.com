class CoversController < ApplicationController
  def index
    @photos      = Photo.search(params[:page], params[:per_page], params[:tags])
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @title = @current_tag.titleize if @current_tag
  end

  def show
    @cover = Photo.find(params[:id])
    @tags  = Photo.relevant_tags
    @title = @cover.name
  end
end
