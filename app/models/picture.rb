class Picture < ActiveRecord::Base
  mount_uploader :picture, PhotoUploader
end
