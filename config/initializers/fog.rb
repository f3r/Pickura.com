CarrierWave.configure do |config|
  config.cache_dir 	 = "#{Rails.root}/tmp/"
  config.storage 	   = :fog
  config.permissions = 0666

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIYKFZSLRFRXCLCZA',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'pickura'
end