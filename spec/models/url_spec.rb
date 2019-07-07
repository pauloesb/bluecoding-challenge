require 'rails_helper'

RSpec.describe Url, type: :model do
  context "With invalid attributes" do
    it "returns error when original url is empty" do
      url_empty = FactoryBot.build(:empty_url)
      expect(url_empty).to_not be_valid
    end

    it "return error when original url is not valid" do
      url_wrong = FactoryBot.build(:wrong_url)
      expect(url_wrong).to_not be_valid
    end
  end

  context "With valid attributes" do
    it "is valid when the original url is correct" do
      url = FactoryBot.build(:url)
      expect(url).to be_valid
    end

    it "generate the short url given an original url" do
      url = FactoryBot.create(:url)
      expect(url.short_url).to_not be_empty 
    end
    
    it "normalize an url upon insert on db" do
      url = FactoryBot.create(:normalize_url)
      expect(Url.last.original_url).to eq("http://g1.globo.com.br")
    end

    # TO-DO / Work on this test later
    # it "dispatch a job to get a title after saved a url" do
    #   Sidekiq::Testing.inline! do
    #     url = FactoryBot.build(:url)
    #     url.save
    #     expect(url.title).to eq("Google")
    #   end
    # end
  end
end
