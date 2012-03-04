class Photo < ActiveRecord::Base

  mount_uploader :source, PhotoUploader
  acts_as_taggable
  acts_as_taggable_on :categories

  before_validation :default_watermark
  before_save :recreate_watermark

  after_save :expire_cache
  after_destroy :expire_cache

  WM_POSITIONS = {:south_east => 'Bottom Right', :north_east => 'Top Right', :north_west => 'Top Left', :south_west => 'Bottom Left'}

  # Returns a collection of tags (with memcached)
  def self.search(page=1, per_page=20, tags=nil)
    # Returns a collection of photos (with memcached)
    if tags.nil?
      Rails.cache.fetch("photos__#{page}") {
        Photo.paginate(:page => page, :per_page => per_page).order('id ASC')
      }
    else
      Rails.cache.fetch("photosTags__#{tags}__#{page}") {
        Photo.tagged_with(tags).paginate(:page => page, :per_page => per_page).order('id ASC')
      }
    end
  end

  # Returns a collection of tags (with memcached)
  def self.relevant_tags(order = 'count desc', at_least = '10')
    Rails.cache.fetch("tagcount__#{order}__#{at_least}") {
      Photo.tag_counts(:order => order, :at_least => at_least)
    }
  end

  def move_watermark(corner = nil)
    self.watermark_position = corner
    self.save
  end

  def default_watermark
    self.watermark_position ||= 'south_east'
  end

  def recreate_watermark
    if !self.new_record? && self.watermark_position_changed?
      self.source.recreate_versions!
    end
  end

  protected

  def expire_cache
    Rails.cache.clear
  end
end
