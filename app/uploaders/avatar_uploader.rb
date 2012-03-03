class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :fog  
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end
  
  version :thumb do
    process :resize_to_fill => [40,40]
  end
end
