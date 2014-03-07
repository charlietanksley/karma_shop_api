Feature: Creating a product
  @javascript
  Scenario: I create a new product
    Given I visit the new product page
    When I create a new product 'such product'
    Then I should see the product 'such product'
