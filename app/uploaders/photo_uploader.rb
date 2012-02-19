class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :fog
  
  version :thumb do
    process :watermark
    process :resize_to_fill => [260,96]
  end
  
  version :branded do
    process :watermark
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end
  
  def watermark
    manipulate! do |img|
      corner =  self.model.watermark_position.to_sym if self.model.watermark_position
     
      case corner
      when :south_east, nil
        gravity = Magick::SouthEastGravity
        path_to_file = "#{Rails.root}/app/assets/images/watermark-right.png"
      when :south_west
        gravity = Magick::SouthWestGravity
        path_to_file = "#{Rails.root}/app/assets/images/watermark-left.png"
      when :north_east
        gravity = Magick::NorthEastGravity
        path_to_file = "#{Rails.root}/app/assets/images/watermark-right.png"
      when :north_west
        gravity = Magick::NorthWestGravity
        path_to_file = "#{Rails.root}/app/assets/images/watermark-left.png"
      end
      
      wfile = Magick::Image.read(path_to_file).first
      
      # SouthEastGravity, SouthWestGravity, NorthEastGravity, NorthWestGravity
      img.composite!(wfile, gravity, Magick::OverCompositeOp)
      img
    end
  end
end
