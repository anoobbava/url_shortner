# controller to handle the urls
class UrlsController < ApiController
  before_action :validate_input_url, only: [:create]
  resource_description do
    short 'API for shortening large urls'
  end

  api :POST, '/url', 'Create Urls'
  description <<-EOS
  == Create Urls
    This API is used to create the short urls from large urls.
  EOS
  error code: 200, desc: 'Success Response'
  error code: 400, desc: 'Bad Request'
  param :url, Hash, description: 'Large Url inputs', required: true do
    param :origin_url, String, desc: 'Url need to shorten', required: true
  end

  def create
    url_instance = UrlDetail.check_url(full_url)
    if url_instance.save
      render status: :ok, json: { short_url: generated_url(url_instance), message: 'successfully created' }
    else
      render status: :bad_request, json: { message: url_instance.errors.full_messages }
    end
  end

  def redirect_to_original_url
    url = request.original_url
    url_instance = UrlDetail.find_by(short_url: url.split('?')[1]) if url
    if url_instance
      redirect_to url_instance.original_url
    else
      render status: :not_found, json: { message: 'no data found' }
    end
  end

  private

  def generated_url(url_instance)
    host_url + '?' + url_instance.short_url
  end

  def host_url
    request.original_url.split('url')[0]
  end

  def validate_input_url
    render(status: :bad_request, json: { message: 'Invalid URL' }) && return unless url_params[:original_url] =~ URI.regexp
  end

  def url_params
    params.require(:url).permit(:original_url)
  end

  def full_url
    params[:url][:original_url]
  end
end
