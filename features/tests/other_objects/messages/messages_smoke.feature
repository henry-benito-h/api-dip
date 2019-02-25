# Created by Henry Benito at 2/23/2019
@messages
Feature: Messages
  As an instructor I want to know the availability of message endpoints

  Background:
    Given I am authenticated as "instructor"

  @smoke
  Scenario: Get a list of messages from inbox
    Given I have the next endpoint "/messages/inbox"
    When I do an api GET request
    Then I should have 200 as status code

  @smoke
  Scenario: Get a list of messages from sent
    Given I have the next endpoint "/messages/sent"
    When I do an api GET request
    Then I should have 200 as status code

  @smoke
  Scenario: No access to messages endpoint
    Given I have the next endpoint "/messages"
    When I do an api GET request
    Then I should have 405 as status code