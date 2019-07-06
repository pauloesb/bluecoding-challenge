class UrlsController < ApplicationController
  before_action :find_url, only: [:redirect, :result]

  def index 
    @url = Url.new
  end

  def redirect
    @url.update(access: @url.access+1)
    redirect_to @url.original_url
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      flash[:success] = "Shortened with success!"
      redirect_to result_path(@url.short_url)
    else
    end
  end

  def top100
    @counter = 1
    @urls = Url.top_100
  end

  private

  def find_url
    @url = Url.find_by_short_url(params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
