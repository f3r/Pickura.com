class CoversController < ApplicationController
  def index
    @covers      = Photo.search(params)
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @title = @current_tag.titleize if @current_tag
  end

  def search
    @covers = Photo.search_tank(params[:query], :page => params[:page], :per_page => params[:per_page])
    if @covers.count == 0
      # Most Popular
      @covers = Photo.search(:page => params[:page], :per_page => params[:per_page], :sorting => 'counter DESC, updated_at DESC, id DESC')
      @most_popular = true
      flash[:notice] = "Sorry, we couldn't find any covers for \"#{params[:query]}\", but maybe you like these :)"
    end
    @tags   = Photo.relevant_tags

    render :index
  end
  
  def most_popular
    @covers       = Photo.search(:page => params[:page], :per_page => params[:per_page], :sorting => 'counter DESC, updated_at DESC, id DESC')
    @tags         = Photo.relevant_tags
    @current_tag  = params[:tags]
    @most_popular = true
    @title = @current_tag.titleize if @current_tag
    
    render :index
  end
 
  def editor_pick
    @covers      = Photo.search(:page => params[:page], :per_page => params[:per_page], 
                    :tags => 'featured', :tag_type => :categories, :sorting => 'updated_at DESC, counter DESC, id DESC')
    @tags        = Photo.relevant_tags
    @current_tag = params[:tags]
    @editor_pick = true
    @title = @current_tag.titleize if @current_tag
    
    render :index
  end

  def random
    @covers = [Photo.random]
    14.times do |foo|
      @covers << Photo.random
    end
    @tags = Photo.relevant_tags

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
