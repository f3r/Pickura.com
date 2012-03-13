class EditorController < ApplicationController
  before_filter :find_cover

  def show
  end

  def download
    #redirect_to @cover.source.branded.url, :type => 'image/jpeg'
    @cover.increase_download_count!
    file = open(@cover.source.branded.url)
    send_file file, :type => 'image/jpeg', :filename => File.basename(@cover.source.url)
  end

  def upload
    Facebook.upload_cover(@cover, current_user)
  end

  def find_cover
    if params[:custom_cover_id]
      @cover = CustomCover.find(params[:custom_cover_id])
    else
      @cover = Photo.find(params[:id])
    end
  end
end
