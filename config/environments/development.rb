HomesliceRe::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  ROLES = ["client","agent","broker","admin"]

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.allow_concurrency = true
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Mailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV["SMTP_SERVER"],
    openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
    port: ENV["SMTP_PORT"].to_i,
    domain: ENV["MAILER_DOMAIN"],
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["SMTP_USER"],
    password: ENV["SMTP_PWD"]
  }

  ENV["REDISTOGO_URL"] = 'redis://redistogo:637d72a361d04b0fb7b4dd2b9ac52412@greeneye.redistogo.com:9382/'
end
