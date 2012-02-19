class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :fog
  
  version :thumb do
    process :resize_to_fill => [260,96]
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end
end
