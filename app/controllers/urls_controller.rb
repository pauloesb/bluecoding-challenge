class UrlsController < ApplicationController
  before_action :find_url, only: :result

  def index 
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      flash[:success] = "Shortened with success!"
      redirect_to result_path(@url.short_url)
    else
    end
  end

  private

  def find_url
    @url = Url.find_by_short_url(params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
