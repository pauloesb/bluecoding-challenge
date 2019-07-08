require 'rails_helper'

RSpec.describe "Top 100 Page Features" do
    before :each do
        i = 0
        Sidekiq::Testing.inline! do
            while i < 10
                url = FactoryBot.create(:url)
                i+=1
            end
        end
    end

    it "show the top 100 frequently accessed pages" do
        visit(top_100_path)
        expect(page).to have_content("Top 100 Most Frequented Links")
        expect(page).to have_content("Google")
    end
end