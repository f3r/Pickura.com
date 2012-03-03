class Facebook
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
    #TODO: Find or create a pickura.com album
    album = @me.albums.last
  end
end