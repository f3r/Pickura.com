class CoversController < ApplicationController
  def index
    @covers      = Photo.search(params)
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @title = @current_tag.titleize if @current_tag
  end
  
  def most_popular
    @covers       = Photo.search(:page => params[:page], :per_page => params[:per_page], :sorting => 'counter DESC')
    @tags         = Photo.relevant_tags
    @current_tag  = params[:tags]
    @most_popular = true
    @title = @current_tag.titleize if @current_tag
    
    render :index
  end
 
  def editor_pick
    @covers      = Photo.search(:page => params[:page], :per_page => params[:per_page], 
                    :tags => 'featured', :tag_type => :categories, :sorting => 'updated_at DESC')
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @editor_pick = true
    @title = @current_tag.titleize if @current_tag
    
    render :index
  end

  def sharing_url
    sharing_url = params[:sharing_url]      
    sharing_url =~ /^([-\d. ()]*)(.*)$/
    id = $1.to_i
    cover = Photo.find(id)
    # track redirects?
    redirect_to gallery_show_path(cover)
  end
  
  def show
    @cover = Photo.find(params[:id])
    @tags  = Photo.relevant_tags('count desc', 17)
    @title = @cover.name
    @cover.increase_viewCount
  end

  def premium
  end
end
