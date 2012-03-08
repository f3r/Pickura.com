class CustomCover < ActiveRecord::Base
  belongs_to :user

  mount_uploader :source, PhotoUploader

  def watermark_position
    :south_east
  end
end
