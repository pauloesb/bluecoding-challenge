#feature/shorten_url.feature 
Feature: Shorten url
  As a user
  I want to shorten my url
  So it become practical to share my url

  Scenario: User shorten his url
    Given I am on the homepage
    When I insert my url "http://www.youtube.com/" and click "Submit"
    Then I should see my shorten url
    And I access my shorten url I should be redirected 