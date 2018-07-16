CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],       # required
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],   # required
    region:                'ap-northeast-2',             # optional, defaults to 'us-east-1'
    endpoint:              'https://s3-ap-northeast-2.amazonaws.com' # 아시아-한국서버
  }
  config.fog_directory  =  ENV["FOG_DIRECTORY"]  # required
end
