# kindly generated by appropriated Rails generator
Mailjet.configure do |config|
  config.api_key = 'e88b89535bd6e9596e2ff71d294ccdfd'
  config.secret_key = 'd7fb773b276bf9df53487da00b898986'
  config.default_from = 'theo.gianella@proton.me'
  # Mailjet API v3.1 is at the moment limited to Send API.
  # We’ve not set the version to it directly since there is no other endpoint in that version.
  # We recommend you create a dedicated instance of the wrapper set with it to send your emails.
  # If you're only using the gem to send emails, then you can safely set it to this version.
  # Otherwise, you can remove the dedicated line into config/initializers/mailjet.rb.
  config.api_version = 'v3.1'
end
