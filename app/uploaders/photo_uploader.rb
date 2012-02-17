class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :fog

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
