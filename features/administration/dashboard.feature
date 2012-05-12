Feature: Dashboard
  In order to see the recent updates
  A user
  Should be able to see the dashboard
  
  Scenario: Show Dashboard
    Given I am logged in
    When I go to the dashboard page
    Then I should see "Recent Updates"