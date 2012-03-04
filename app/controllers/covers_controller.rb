class CoversController < ApplicationController
  def index
    @photos      = Photo.search(params[:page], params[:per_page], params[:tags])
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @title = @current_tag.titleize if @current_tag
  end
  
  def most_popular
    @photos       = Photo.search(params[:page], params[:per_page], nil, 'counter DESC')
    @tags         = Photo.relevant_tags
    @current_tag  = params[:tags]
    @most_popular = true
    @title = @current_tag.titleize if @current_tag
    
    render :index
  end

  def editor_pick
    @photos      = Photo.search(params[:page], params[:per_page], 'featured', 'updated_at DESC', false)
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @editor_pick = true
    @title = @current_tag.titleize if @current_tag
    
    render :index
  end
  
  def show
    @cover = Photo.find(params[:id])
    @tags  = Photo.relevant_tags
    @title = @cover.name
    @cover.increase_viewCount
  end
end
