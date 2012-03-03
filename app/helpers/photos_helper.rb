module PhotosHelper
  def watermark_positions_options
    Photo::WM_POSITIONS.collect{|k, v| [k.to_s, v]}
  end
  
  def seo_photo_path(photo)
    result = photo.name.dup
    result.gsub!(/[^\x00-\x7F]+/, '') # Remove anything non-ASCII entirely (e.g. diacritics).
    result.gsub!(/[^\w_ \-]+/i, '')   # Remove unwanted chars.
    result.gsub!(/[ \-]+/i, '-')      # No more than one of the separator in a row.
    result.gsub!(/^\-|\-$/i, '')      # Remove leading/trailing separator.
    result.downcase!
    "/gallery/#{photo.id}-#{result}-facebook-timeline-cover"
  end
end
