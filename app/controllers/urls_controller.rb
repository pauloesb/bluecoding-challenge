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
    respond_to do |format|
      if @url.save
        format.html { redirect_to result_path(@url.short_url), notice: "Link shortened with success!" }
      else
        format.html { redirect_to root_path, notice: "Unable to shorten this link!" }
      end
    end
  end

  def top100
    @counter = 1
    @urls = Url.top_100
  end

  private

  def url_not_found
      @url || (redirect_to root_path, notice: "This record doesn't exist!")
  end

  def find_url
    @url = Url.find_by_short_url(params[:short_url])
    url_not_found
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
