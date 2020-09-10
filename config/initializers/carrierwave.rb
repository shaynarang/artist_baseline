if Rails.env.test? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config| 
    config.fog_credentials = { 
      provider: 'AWS', 
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'], 
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'us-east-2'
    } 
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_public = false 
  end 
end
