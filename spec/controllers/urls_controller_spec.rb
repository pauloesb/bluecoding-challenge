require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "contains Url model instance" do
      get :index
      expect(assigns(:url)).to be_a_new(Url)
    end
  end

  describe "POST #create" do
    it "create a new Url" do
      expect{ post :create, params: {url: attributes_for(:url)}}.to change(Url, :count).by(1)
    end

    it "redirect short url from the original url" do
      url = FactoryBot.create(:url)
      post :create, params: {url: attributes_for(:url)}
      expect(response).to redirect_to Url.find_by_original_url(url.original_url).short_url
    end
  end

end
