class Photo < ActiveRecord::Base
  mount_uploader :source, PhotoUploader
  acts_as_taggable
end
