# step_definitions/top_100.rb
FactoryBot.create(:url)

Given(/^I am on the main page$/) do
  visit root_path
end

When(/^I click on the link "([^"]*)"$/) do |link|
  click_link link
end

Then(/^I should see a list of the top 100 most accesed links$/) do
  expect(current_path).to eq(top_100_path)
  expect(page).to have_content(Url.last.original_url)
end
