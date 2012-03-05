class Facebook
  ALBUM_NAME = 'Pickura.com'

  def self.upload_cover(cover, user)
   @me = FbGraph::User.me(user.token)
   album = self.find_or_create_album
   file = open(cover.source.branded.url)
   album.photo!(
     :access_token => user.token,
     #:message => 'Pickura.com - Cover Picture',
     :source => file
   )
  end

  def self.find_or_create_album
    album = @me.albums.find{|a| a.name == ALBUM_NAME}
    unless album
      #album = @me.albums.last
      album = @me.album!(
        :name => ALBUM_NAME
      )
    end
    album
  end

  def self.albums(user)
    @me = FbGraph::User.me(user.token)
    @me.albums.reject{|a| a.count <= 1}
  end

end