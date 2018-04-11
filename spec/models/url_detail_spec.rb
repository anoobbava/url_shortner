# Url_details spec

require 'spec_helper'

RSpec.describe UrlDetail, type: :model do
  describe 'UrlDetail model' do
    it 'check the fields' do
      expect(UrlDetail.new(original_url: '')).not_to be_valid
    end
    it 'should validate fields' do
      expect(UrlDetail.new(short_url: '')).not_to be_valid
    end
    it 'should validate fields' do
      expect(UrlDetail.new(original_url: 'https://github.com/anoobbava/url_shortner', short_url: '10554c1')).to be_valid
    end
  end

  describe 'Generate Short url' do
    it 'short url to be created' do
      url_instance = UrlDetail.check_url('https://github.com/carrierwaveuploader/carrierwave/issues/1486')
      expect(url_instance.short_url).to eq('0a9a2b0')
    end
  end

  describe 'UrlDetail model' do
    it 'should find out full_url from database if exit' do
      valid_url = FactoryBot.create(:valid_url)
      existing_url = UrlDetail.check_url(valid_url.original_url)
      expect(valid_url.original_url).to eq(existing_url.original_url)
    end
  end
end
