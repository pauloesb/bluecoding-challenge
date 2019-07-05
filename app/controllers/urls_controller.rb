class UrlsController < ApplicationController
  def index 
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
    redirect_to root_path
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
