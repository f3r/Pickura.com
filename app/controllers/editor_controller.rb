class EditorController < ApplicationController
  before_filter :find_cover

  def show
  end

  def download
    #redirect_to @cover.source.branded.url, :type => 'image/jpeg'
    file = open(@cover.source.branded.url)
    send_file file, :type => 'image/jpeg', :filename => File.basename(@cover.source.url)
  end

  def upload
    me = FbGraph::User.me(current_user.token)
    album = me.albums.last

    file = open(@cover.source.branded.url)
    album.photo!(
      :access_token => current_user.token,
      :source => file,
      :message => 'Pickura.com - Cover Picture'
    )
    render :text => 'Uploaded'
  end

  def find_cover
    @cover = Photo.find(params[:id])
  end
end
