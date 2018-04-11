# controller to handle the urls
class UrlsController < ApplicationController
  before_action :validate_input_url, only: [:create]
  def create
    url_instance = UrlDetail.check_url(full_url)
    if url_instance.save
      render status: :ok, json: { shortend_url: generated_url(url_instance), message: 'successfully created' }
    else
      render status: :bad_request, json: { message: url_instance.errors.full_messages }
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
