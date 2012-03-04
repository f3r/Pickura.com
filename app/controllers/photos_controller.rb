class PhotosController < ApplicationController

  layout 'admin', :except => [:gallery, :gallery_show]
  before_filter :security_check, :except => [:gallery, :gallery_show]


  def gallery
    @photos      = search(params[:page], params[:per_page], params[:tags])
    @tags        = tagCounts()
    @current_tag = params[:tags]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  def gallery_show
    @photo = Photo.find(params[:id])
    @tags  = tagCounts()

    respond_to do |format|
      format.html
      format.json { render json: @photo }
    end
  end
  
  ##########################################################################################
  # ADMIN CONTROLLER ACTIONS BELLOW
  ##########################################################################################
  def index
    @photos = search(params[:page], 50)

    respond_to do |format|
      format.html
      format.json { render json: @photos }
    end
  end

  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def watermark
    @photo = Photo.find(params[:id])
    if @photo.move_watermark(params[:corner])
      redirect_to @photo, notice: 'Photo successfully updated.'
    else
      redirect_to @photo, notice: 'Error' 
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.js { render :layout => false }
    end
  end
  
private
  def security_check
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "Sorry, you are not authorized there :)"
      redirect_to root_url
    end
  end

  # Returns a collection of photos (with memcached)
  def search(page=1, per_page=20, tags=nil)
    if tags.nil?
      Rails.cache.fetch("photos__#{page}") {
        Photo.paginate(:page => page, :per_page => per_page).order('id ASC')
      }
    else
      Rails.cache.fetch("photosTags__#{tags}__#{page}") {
        Photo.tagged_with(tags).paginate(:page => page, :per_page => per_page).order('id ASC')
      }
    end
  end

  # Returns a collection of tags (with memcached)
  def tagCounts(order = 'count desc', at_least = '10')
    Rails.cache.fetch("tagcount__#{order}__#{at_least}") {
      Photo.tag_counts(:order => order, :at_least => at_least)
    }
  end
end
