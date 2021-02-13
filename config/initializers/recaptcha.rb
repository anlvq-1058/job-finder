Recaptcha.configure do |config|
  config.site_key  = ENV["site_key"]
  config.secret_key = ENV["secreted_key"]
end
