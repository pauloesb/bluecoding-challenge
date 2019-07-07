# step_definitions/shorten_url.rb

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I insert my url "([^"]*)" and click "([^"]*)"$/) do |value, submit|
  fill_in "url_original_url", with: value, visible: false
  click_button submit
end

Then(/^I should see my shorten url$/) do
  expect(current_path).to_not eq(root_path)
  expect(page).to have_css("span#original_url", text: "http://youtube.com")
end

And(/^I access my shorten url I should be redirected$/) do
  visit redirect_path(Url.last.short_url)
  expect(page.current_url).to  eq("#{Url.last.original_url}/")
end