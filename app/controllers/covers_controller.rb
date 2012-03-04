class CoversController < ApplicationController
  def index
    @photos      = Photo.search(params)
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @title = @current_tag.titleize if @current_tag
  end
  
  def most_popular
    @photos       = Photo.search(:page => params[:page], :per_page => params[:per_page], :sorting => 'counter DESC')
    @tags         = Photo.relevant_tags
    @current_tag  = params[:tags]
    @most_popular = true
    @title = @current_tag.titleize if @current_tag
    
    render :index
  end
 
  def editor_pick
    @photos      = Photo.search(:page => params[:page], :per_page => params[:per_page], 
                    :tags => 'featured', :tag_type => :categories, :sorting => 'updated_at DESC')
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

  def premium
  end
end
