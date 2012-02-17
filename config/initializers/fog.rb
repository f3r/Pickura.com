CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIYKFZSLRFRXCLCZA',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'pickura'
  config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # config.root = ::Rails.root.to_s + "/public"
end