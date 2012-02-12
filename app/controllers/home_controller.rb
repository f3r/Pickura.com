class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'step_one'
    else
      render 'index'    
    end
  end

  def editor
  end
end
