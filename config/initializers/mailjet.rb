# kindly generated by appropriated Rails generator
Mailjet.configure do |config|
  config.api_key = 'eb620ab6993179285a24723da4ed0e99'
  config.secret_key = 'e99000d950927010c21260c951f146a1'
  #config.default_from = 'testgmail.com'
  # Mailjet API v3.1 is at the moment limited to Send API.
  # We’ve not set the version to it directly since there is no other endpoint in that version.
  # We recommend you create a dedicated instance of the wrapper set with it to send your emails.
  # If you're only using the gem to send emails, then you can safely set it to this version.
  # Otherwise, you can remove the dedicated line into config/initializers/mailjet.rb.
  config.api_version = 'v3.1'
end
