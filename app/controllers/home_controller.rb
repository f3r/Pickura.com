class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to gallery_path
    else
      @photos = []
      (1..11).each {|i|
        @photos << "https://s3.amazonaws.com/pickura/static/branded#{i}.jpg"
      }
      render 'welcome'
    end
  end
  
  def subscribe
    ip = request.env["HTTP_X_FORWARDED_FOR"]
    @subscriber = Subscriber.new(:email => params[:email], :ip => ip)
    respond_to do |format|
      if @subscriber.save
        format.js { render :layout => false }
      else
        format.js { render :layout => false }
      end
    end
  end

  # TODO: Add unsuscribe action
  def unsubscribe
  end

end
