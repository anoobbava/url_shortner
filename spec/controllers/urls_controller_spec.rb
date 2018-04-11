# spec for urls controllers
require 'spec_helper'

RSpec.describe UrlsController, type: :controller do
  before(:each) do
    @url = {
      original_url: 'http://tech.eshaiju.in/blog/2016/02/15/apipi-dumping-examples-in-to-apipie-examples-file/'
    }
    @invalid_data = {
      original_url: 'qwertyuiopasdfghjkl'
    }

    @no_data = {
      original_url: ''
    }
  end

  describe 'Post #Create' do
    it 'should create new short ulr from original url' do
      post :create, params: { url: @url }, format: :json
      url_instance =  UrlDetail.find_by_original_url(@url[:original_url])
      expect(url_instance.short_url).to eq('4f6e71f')
      json_response = JSON.parse(response.body)
      message = 'successfully created'
      expect(json_response['message']).to eq(message)
      expect(response.status).to eq(200)
    end

    it 'should return invalid url message if url is not valid' do
      post :create, params: { url: @invalid_data }, format: :json
      json_response = JSON.parse(response.body)
      message = 'Invalid URL'
      expect(json_response['message']).to eq(message)
      expect(response.status).to eq(400)
    end

    it 'raise 400 error' do
      post :create, params: { url: @no_data }, format: :json
      json_response = JSON.parse(response.body)
      expect(response.bad_request?).to be(true)
      expect(response.status).to eq(400)
    end

    it 'should return short url if already exist in database' do
      original_url = 'http://tech.eshaiju.in/blog/2016/02/15/apipi-dumping-examples-in-to-apipie-examples-file/'
      short_url = '4f6e71f'
      url_instance = UrlDetail.create(original_url: original_url, short_url: short_url)
      post :create, params: { url: @url }, format: :json
      json_response = JSON.parse(response.body)
      message = 'successfully created'
      expect(json_response['message']).to eq(message)
      expect(url_instance.id).to eq(UrlDetail.last.id)
      expect(response.status).to eq(200)
    end
  end
end
