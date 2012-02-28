class Photo < ActiveRecord::Base

  mount_uploader :source, PhotoUploader
  acts_as_taggable
  acts_as_taggable_on :categories
    
  before_validation :default_watermark
  before_save :recreate_watermark
    
  WM_POSITIONS = {:south_east => 'Bottom Right', :north_east => 'Top Right', :north_west => 'Top Left', :south_west => 'Bottom Left'}
  
  def move_watermark(corner = nil)
    self.watermark_position = corner
    self.save
  end
  
  def default_watermark
    self.watermark_position ||= 'south_east'
  end
  
  def recreate_watermark
    if self.watermark_position_changed?
      self.source.recreate_versions!
    end
  end
end
