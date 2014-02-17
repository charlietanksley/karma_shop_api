Feature: Viewing the list of potential customers
  @javascript
  Scenario: I can see all the potential customers
    Given 'someone, someone else, a third someone, :fish:' all have karma
    When I visit the main page
    Then I should see 'someone, someone else, a third someone, :fish:' in the potential customer list
