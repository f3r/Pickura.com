class PhotosController < ApplicationController
  layout 'admin'
  before_filter :security_check

  ##########################################################################################
  # ADMIN CONTROLLER ACTIONS BELLOW
  ##########################################################################################
  def index
    @photos = Photo.search(:page => params[:page], :per_page => 50, :sorting => 'id ASC')
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
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
end
