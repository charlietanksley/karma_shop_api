Feature: Viewing a customer's treasures
  @javascript
  Scenario: I can see all the potential customers
    Given 'someone' has 'a cool treasure' as a treasure
    When I visit the treasure page for 'someone'
    Then I should see the treasure 'a cool treasure'
