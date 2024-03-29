Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    Scenario: User is not signed up
      Given I do not exist as a user
      When I sign in with valid credentials
      Then I see an invalid login message
        And I should be signed out

    Scenario: User has not confirmed account
      Given I exist as an unconfirmed user
      And I am not logged in
      When I sign in with valid credentials
      Then I see an unconfirmed account message
      And I should be signed out
    Scenario: User signs in successfully
      Given I exist as a user
        And I am not logged in
      When I sign in with valid credentials
      And I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: User enters wrong email
      Given I exist as a user
      And I am not logged in
      When I sign in with a wrong email
      Then I see an invalid login message
      And I should be signed out
      
    Scenario: User enters wrong password
      Given I exist as a user
      And I am not logged in
      When I sign in with a wrong password
      Then I see an invalid login message
      And I should be signed out
      
    Scenario: Banned user login
      Given I exist as a banned user
      And I am not logged in
      When I sign in with valid credentials
      Then I see an inactive login message
      And I should be signed out
    
    Scenario: User cannot go to the new account page if they are already logged in
      Given I am logged in
      When I go to the new account page
      Then I should be redirected to root page
      