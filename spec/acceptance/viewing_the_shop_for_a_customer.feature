Feature: Viewing the shop for a customer
  @javascript
  Scenario: I see the items available for the customer
    Given the product 'a cool treasure' exists
    When I visit the shopping page for 'some term'
    Then I should see the sale item 'a cool treasure'
