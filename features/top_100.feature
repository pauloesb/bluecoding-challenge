#feature/top_100.feature 
Feature: Top 100 Accessed Pages
  As a User
  I want to access my homepage
  When I click Top 100
  I want to see the top 100 most accessed links

  Scenario: Accessing Top 100 Accessed Links
  Given I am on the main page
  When I click on the link "Top 100"
  Then I should see a list of the top 100 most accesed links