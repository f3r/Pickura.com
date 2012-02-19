module PhotosHelper
  def watermark_positions_options
    Photo::WM_POSITIONS.collect{|k, v| [k.to_s, v]}
  end
end
