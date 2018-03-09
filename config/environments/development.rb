Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  ENV['TWILIO_ACCOUNT_SID'] = 'AC82ba5a90181f5dabfb23dc6a63285745'
  ENV['TWILIO_AUTH_TOKEN'] = 'cee63b631a8d2c2b279848340972b186'

  ENV['AUTHY_API_KEY'] = 'aLP2PPSr3jC0DwS6XAl86m2h9j118MEM'
  ENV['AUTHY_API_URI'] = 'https://api.authy.com/'

  ENV['PUSHER_APP_ID'] = '486614'
  ENV['PUSHER_KEY'] = 'cb28bccd5f31c69fcf48'
  ENV['PUSHER_SECRET'] = 'a03bd31aaca6a35ba56d'
  ENV['PUSHER_CLUSTER'] = 'us2'

  ENV['ONESIGNAL_APP_ID'] = '829f49c6-9d62-4670-b257-3d07c3e81b67'
  ENV['ONESIGNAL_API_KEY'] = 'MDQyMTZhMTgtOTdlZC00OGZmLTg2ZjgtNDJiYmIzZTFmYmIw'

  ENV['SLACK_SIGNUPS_CHANNEL'] = '#mixrelay-dev'
  ENV['SLACK_DAILY_STATS_CHANNEL'] = '#mixrelay-dev'
  ENV['SLACK_INCOMING_WEBHOOK_URL'] = 'https://hooks.slack.com/services/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'
end
