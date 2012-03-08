module PhotosHelper
  def watermark_positions_options
    Photo::WM_POSITIONS.collect{|k, v| [k.to_s, v]}
  end
  
  def permalink(cover)
    if Rails.env.production?
      "http://www.pickura.com/gallery/#{cover.id}-#{cover.slug}"
    else
      "http://#{request.host}:#{request.port}/gallery/#{cover.id}-#{cover.slug}"
    end
  end

end
