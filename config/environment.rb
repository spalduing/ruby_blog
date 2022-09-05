# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Devise::Mailer.default_url_options = { host: 'enigmatic-falls-62442.herokuapp.com' }
# Devise::Mailer.delivery_method = :smtp
# Devise::Mailer.perform_deliveries = true
# Devise::Mailer.raise_delivery_errors = true

# Devise::Mailer.smtp_settings = {
#   domain: 'enigmatic-falls-62442.herokuapp.com',
#   address: ENV['MAILGUN_SMTP_SERVER'].to_s,
#   port: ENV['MAILGUN_SMTP_PORT'].to_s,
#   user_name: ENV['MAILGUN_SMTP_LOGIN'].to_s,
#   password: ENV['MAILGUN_SMTP_PASSWORD'].to_s,
#   authentication: 'plain',
#   enable_starttls_auto: true
# }