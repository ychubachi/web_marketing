Feature: Sign up
  In order not to get access to protected sections of the site
  As a user
  I do not want to be able to sign up

    Background:
      Given I am not logged in

    Scenario: User signs up with valid data
      When I sign up with valid user data it should fail with an error
      Then I should not see a successful sign up message
