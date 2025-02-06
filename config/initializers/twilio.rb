Twilio.configure do |config|
  config.account_sid = Rails.application.credentials.dig(:twilio, :sid)
  config.auth_token = Rails.application.credentials.dig(:twilio, :at)
 end
