class Photo < ActiveRecord::Base
  mount_uploader :source, PhotoUploader
end
