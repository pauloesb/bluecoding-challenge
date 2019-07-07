Sidekiq.configure_server do |config|
    config.redis = { url: Settings.redis.host }
end

Sidekiq.configure_client do |config|
    config.redis = { url: Settings.redis.host }
end
    
# Perform Sidekiq jobs immediately in development,
# so you don't have to run a separate process.
# You'll also benefit from code reloading.
if Rails.env.development?
    require 'sidekiq/testing'
    Sidekiq::Testing.inline!
end