Feature: Users Administration
  In order to manage staffs/users
  A user
  Should be able to see users page
  
  Scenario: Show Users
    Given I am logged in
    When I go to the users page
    Then I should see "New User"