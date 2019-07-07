require 'rails_helper'

RSpec.describe "Index Page Features" do
    it "contains the title of the app" do
        visit(root_path)
        expect(page).to have_title "Blue Coding Short URL"
    end

    it "return to index page if accessed no shorten url" do
        visit('/faefaefe')
        expect(current_path).to eql(root_path)
    end

    it "return to index page if given wrong url form to shorten" do
        visit(root_path)
        fill_in 'url_original_url', with: 'anything' 
        click_button 'Submit'
        expect(current_path).to eql(root_path)
    end

    it "go to result page if given a url to shorten it" do
        visit(root_path)
        url = FactoryBot.build(:dummy_url)
        fill_in 'url_original_url', with: url.original_url
        click_button 'Submit'
        expect(current_path).to eql(result_path(Url.last.short_url))
        expect(page).to have_css("span#original_url", text: url.original_url)
        expect(page).to have_css("span#short_url", text: Url.last.short_url)
    end
end