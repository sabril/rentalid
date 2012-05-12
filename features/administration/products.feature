Feature: Products Administration
  In order to manage products
  A user
  Should be able to see products page
  
  Scenario: Show Products
    Given I am logged in
    And I have a product
    When I go to the products page
    Then I should see "New Product"
    And I should see "Sample Product"