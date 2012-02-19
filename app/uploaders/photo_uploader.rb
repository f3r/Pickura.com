class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog
  
  version :thumb do
    process :resize_to_fill => [260,96]
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end
end
