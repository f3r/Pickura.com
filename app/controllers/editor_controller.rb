class EditorController < ApplicationController
  def show
    @cover = Photo.find(params[:id])
  end
end
