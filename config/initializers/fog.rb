CarrierWave.configure do |config|
  config.cache_dir 	 = "#{Rails.root}/tmp/"
  config.storage 	   = :fog
  config.permissions = 0666

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'MY KEY',
    :aws_secret_access_key  => 'MY SECRET',
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'pickura'
end