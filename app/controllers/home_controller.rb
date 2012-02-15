class HomeController < ApplicationController
  def index
    if user_signed_in?
      load_pictures
      render 'index', :layout => 'sidebar'
    else
      render 'welcome'    
    end
  end

  def editor
  end
  
  protected
  
  def load_pictures
    @picture = current_user.current_picture
    @pictures = Picture.all
  end
end
