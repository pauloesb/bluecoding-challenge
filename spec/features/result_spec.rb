require 'rails_helper'

RSpec.describe "Result Page Features" do
    it "show the shorten url given the original url" do
        url = FactoryBot.create(:complete_url)
        visit(result_path(url.short_url))
        expect(current_path).to eql(result_path(url.short_url))
        expect(page).to have_css("span#original_url", text: url.original_url)
        expect(page).to have_css("span#short_url", text: url.short_url)
    end

    it "redirect to index page if given an wrong id to result url" do
        visit(result_path('rgsdfrts'))
        expect(current_path).to eql(root_path)
        expect(page).to have_content("BC Link Shortener")
    end
end