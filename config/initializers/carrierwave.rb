CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJE7LUSARVCHGI4EQ',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'ap-southeast-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'ngerentaldev'  if Rails.env == "production"                   # required
  config.fog_directory  = 'ngerentaldev'  if Rails.env == "development" 
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end