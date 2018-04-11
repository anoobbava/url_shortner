# model for UrlDetail
class UrlDetail < ApplicationRecord
  validates_presence_of :short_url, :original_url

  class << self
    def check_url(url)
      find_or_initialize_by(original_url: url, short_url: generate_hash_value(url))
    end

    def generate_hash_value(url)
      Digest::MD5.hexdigest(url).slice(0..6)
    end
  end
end
