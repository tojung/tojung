# # config.redis = { url: "redis://#{redis_config[:host]}:#{redis_config[:port]}/12" }
# rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
# rails_env = Rails.env || 'development'
# redis_config = YAML.load_file(rails_root.to_s + '/config/redis.yml')
# redis_config.merge! redis_config.fetch(Rails.env, {})
# redis_config.symbolize_keys!
#
# if Rails.env == 'development'
#   $redis = Redis.new(host: redis_config[:development]['host'], port: redis_config[:development]['port'])
# else
#   $redis = Redis.new(host: redis_config[:production]['host'], port: redis_config[:production]['port'])
#   print($redis)
#   print(redis_config)
#   print(redis_config[:production]['host'])
# end
