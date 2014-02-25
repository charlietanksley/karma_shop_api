Feature: Buying an item for a customer
  @javascript
  Scenario: I buy an item for a customer and see it in their belongings
    Given the product 'a cool treasure' exists
    And I vist the shopping page for 'some term'
    And 'some term' can afford 'a cool treasure'
    When I buy 'a cool treasure'
    And I visit the treasure page for 'some term'
    Then I should see the treasure 'a cool treasure'