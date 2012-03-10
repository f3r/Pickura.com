require 'rubygems'
require 'sitemap_generator'

# Configuration
SitemapGenerator::Sitemap.default_host  = "http://www.pickura.com"
SitemapGenerator::Sitemap.public_path   = 'tmp/'
SitemapGenerator::Sitemap.adapter       = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.sitemaps_host = "https://s3.amazonaws.com/pickura/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemap/'

# Links creation logic
SitemapGenerator::Sitemap.create do  
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host

  add gallery_popular_path,      :changefreq => 'daily'
  add gallery_editor_pick_path,  :changefreq => 'daily' 

  # Images Sitemap http://support.google.com/webmasters/bin/answer.py?hl=en&answer=178636
  Photo.find_each do |photo|
    # TODO: Manage to require this fucking file from PhotosHelper::seo_photo_path
    result = photo.name.dup
    result.gsub!(/[^\x00-\x7F]+/, '') # Remove anything non-ASCII entirely (e.g. diacritics).
    result.gsub!(/[^\w_ \-]+/i, '')   # Remove unwanted chars.
    result.gsub!(/[ \-]+/i, '-')      # No more than one of the separator in a row.
    result.gsub!(/^\-|\-$/i, '')      # Remove leading/trailing separator.
    result.downcase!
    #url = "/gallery/#{photo.id}-#{result}-facebook-timeline-cover"
    url = "/#{result}-facebook-timeline-cover"
    add(url, :lastmod => photo.updated_at, 
        :images => [{ :loc => photo.source.branded.url, :title => photo.name, :caption => photo.tag_list.join(" ") }])
  end
  
  # Add all tag pages
  Photo.tag_counts_on(:tags).each do |tag|
    add gallery_path(tag.name)
  end  
end
