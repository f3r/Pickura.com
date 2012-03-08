class CreatorController < ApplicationController
  def index
    @models = []
    @models << {:title => 'Echo', :name => :echo, :sample => 'echo.jpg'}
    @models << {:title => 'Museum Wall', :name => :soon, :sample => 'array.png'}
    @models << {:title => 'Stack of Polaroids', :name => :soon, :sample => 'stack.jpg'}
  end

  def show
    @cover = CustomCover.where(:user_id => current_user.id, :id => params[:id]).first
  end

  def new
    case params[:model]
    when 'echo'
      #@cover = CustomCover.where(:user_id => current_user.id).first
      unless @cover
        cover_image = Collage.echo(current_user)
        @cover = CustomCover.create!(:user => current_user, :source => open(cover_image))
      end
      redirect_to creator_cover_path(@cover)
    else
      render :text => 'cooming_soon'
    end
  end
end