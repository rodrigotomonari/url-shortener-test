class UrlShortenersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    render json: UrlShortener.new.store(url_param)
  end

  def show
    url = UrlShortener.new.retrieve(params[:id])

    return redirect_to url if url

    redirect_to '/'
  end

  private

  def url_param
    return params[:url] if params[:url].present?

    JSON.parse(request.raw_post)['url']
  end
end
