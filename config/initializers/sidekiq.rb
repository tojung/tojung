rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
rails_env = Rails.env || 'development'
redis_config = YAML.load_file(rails_root.to_s + '/config/redis.yml')
redis_config.merge! redis_config.fetch(Rails.env, {})
redis_config.symbolize_keys!

Sidekiq.configure_server do |config|
 config.redis = { url: "redis://#{redis_config[:host]}:#{redis_config[:port]}/12" }
end
Sidekiq.configure_client do |config|
 config.redis = { url: "redis://#{redis_config[:host]}:#{redis_config[:port]}/12" }
end
if Rails.env == "development"
  $redis = Redis.new(:host => redis_config[:development]["host"], :port => redis_config[:development]["port"])
else
 $redis = Redis.new(:host => redis_config[:production]["host"], :port => redis_config[:production]["port"])
 print($redis)
 print(redis_config)
 print(redis_config[:production]["host"])
end
