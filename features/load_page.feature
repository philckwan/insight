Feature: Loading the page and check values

  The page should have 6 labels and 6 text fields
  The six text fields should be positive currency values
  The 6th text field value should equal the sum of the other 5 text field values

  Background:
    Given a Chrome web browser
    And a list of label and text field names

  Scenario: Users see 6 labels and 6 text fields
    When a user loads the values website
    Then the user should see six text labels
    And the user should see six text fields
    And the text field values are formatted as positive currency numbers
    And the value of "txt_ttl_val" is the sum of the other text field values
