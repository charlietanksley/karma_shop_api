Feature: Viewing all products
  @javascript
  Scenario: I view the list of products
    Given the product 'a cool treasure' exists
    When I visit the products page
    Then I should see the product 'a cool treasure'
