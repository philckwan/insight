Feature: Google search functionality

  Scenario: Users can search for hello world on Google
    Given a user goes to Google
    When they search for "hello world"
    Then Google should return results for "hello world"