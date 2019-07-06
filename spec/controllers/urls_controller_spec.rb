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
      expect{ post :create, params: { url: attributes_for(:url) } }.to change(Url, :count).by(1)
    end
  end

  describe "GET #result" do
    before :each do
      post :create, params: { url: attributes_for(:url) } 
    end

    it "returns http success to a result" do
      get :result, params: { short_url: Url.last.short_url }
      expect(response).to have_http_status(:success)
    end

    it "render result" do
      subject { get :result, params: {short_url: Url.last.short_url } }
      expect(subject).to redirect_to result_url(Url.last.short_url)
    end
  end

  describe "GET #redirect" do
    before :each do
      post :create, params: { url: attributes_for(:url) } 
    end

    it "redirect to the original url" do
      get :redirect, params: { short_url: Url.last.short_url }
      expect(response).to redirect_to Url.last.original_url
    end

    it "raise the access count by 1" do
      get :redirect, params: {short_url: Url.last.short_url } 
      expect(Url.last.access).to be(1)
    end
  end

end
