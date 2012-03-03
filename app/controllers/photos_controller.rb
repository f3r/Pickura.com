class PhotosController < ApplicationController

  layout 'admin', :except => [:gallery]
  before_filter :security_check, :except => [:gallery]
  
  def index
    @photos = Photo.paginate(:page => params[:page], :per_page => 50).order('id ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end
  
  def gallery
    if !params[:tags].blank?
      @photos = Photo.tagged_with(params[:tags]).paginate(:page => params[:page], :per_page => 20).order('id ASC')
      @current_tag = params[:tags]
    else
      @photos = Photo.paginate(:page => params[:page], :per_page => 20).order('id ASC')
    end
    @tags = Photo.tag_counts(:order => 'count desc', :at_least => 10)
    
    respond_to do |format|
      format.html # index.html.erb
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
    if !user_signed_in? || !current_user.role
      flash[:notice] = "Sorry, you are not authorized there :)"
      redirect_to root_url
    end
  end
end
