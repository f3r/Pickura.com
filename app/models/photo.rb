class Photo < ActiveRecord::Base

  mount_uploader :source, PhotoUploader
  acts_as_taggable
  acts_as_taggable_on :categories

  include Tanker # Search engine

  extend FriendlyId
  friendly_id :name_suffix, use: :slugged
  def name_suffix
    "#{name}-facebook-timeline-cover"
  end

  before_validation :default_watermark
  before_save       :recreate_watermark
  after_save        :expire_cache, :update_tank_indexes
  after_destroy     :expire_cache, :delete_tank_indexes

  WM_POSITIONS = {:south_east => 'Bottom Right', :north_east => 'Top Right', :north_west => 'Top Left', :south_west => 'Bottom Left'}

  tankit 'photo_index' do
    indexes :name
    indexes :description
    indexes :id
    indexes :tag_list     # Array of Tags
    indexes :counter
    indexes :counter_downloads
  end

  # Note! Will Paginate pagination, thanks mislav!
  def self.per_page
    15
  end

  # Returns a collection of tags (with memcached)
  #  [page            Integer       Page number of the collection
  #  [per_page]       Integer       Number of elements per page
  #  [tags]           String/Array  Tags to search
  #  [sorting]        String        Column to sort the collection
  #  [search_by_tag]  Boolean       If true it will search on :tags, otherwise on :categories
  def self.search(opts = {})
    opts[:page]     ||= 1
    opts[:per_page] ||= 15
    opts[:sorting]  ||= 'id DESC'
    opts[:tag_type] ||= :tags
    
    if opts[:tags]
      result = Photo.tagged_with(opts[:tags], :on => opts[:tag_type])
    else
      result = Photo
    end
    
    result.order(opts[:sorting]).paginate(:page => opts[:page], :per_page => opts[:per_page])
  end

  # Returns a collection of tags (with memcached)
  def self.relevant_tags(order = 'count desc', limit = nil)
    Photo.tag_counts(:order => order, :at_least => 10, :limit => limit)
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

  def increase_view_count!
    ActiveRecord::Base.transaction do
      self.counter = self.counter + 1
      self.save!
    end
  end

  def increase_download_count!
    ActiveRecord::Base.transaction do
      self.counter_downloads = self.counter_downloads + 1
      self.save!
    end
  end

  def download_count
    count = counter_downloads + download_seed_fake
  end

  def self.random
    offset = rand(Photo.count)
    rand_record = Photo.first(:offset => offset)
  end
  
  protected

  def expire_cache
    Rails.cache.clear
  end
end
