# config for api_doc
Apipie.configure do |config|
  config.app_name                = "UrlShortner"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/url_doc"
  config.validate                = false
  config.languages = ['en']
  config.default_locale = 'en'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
