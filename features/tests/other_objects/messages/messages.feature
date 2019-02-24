# Created by Henry Benito at 2/23/2019
@messages
Feature: Messages
  # Enter feature description here

  Background:
    Given I am authenticated as "instructor henry"

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


  @acceptance
  Scenario: Get a list of messages
    Given I have the next endpoint "/messages/inbox"
    And I have the body payload below
    """
    {
      "message": "Requires ",
      "documentation_url": "https://developer.github.com/v3/users/#get-the-authenticated-user"
    }
    """
    When I do an api GET request
    Then I should have 200 as status code

  @acceptance
  Scenario: Create a message
    Given I have the next endpoint "/messages"
    And I have the body payload below
    """
    {
      "subject": "The subject of the message",
      "message": "The body of the message",
      "recipient_ids": "67129487"
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
      And response body should match with content
      """
      {
        "subject": "The subject of the message",
        "recipient_ids": "67129487",
        "mid": null,
        "author_id": 81029063,
        "message_status": null,
        "message": "The body of the message"
      }
      """

  @acceptance
  Scenario: Update a message
    Given I have the next endpoint "/messages"
      And I have a record already created with this content
        """
        {
          "subject": "The subject of the message",
          "message": "The body of the message",
          "recipient_ids": "67129487"
        }
        """
      And I have the next endpoint "/messages/inbox/:id"
      And I have the body payload below
      """
      {
        "message_status": "read"
      }
      """
    When I do an api PUT request
    Then I should have 204 as status code
      And response body should match with empty content
    When I do an api GET request
    Then response body should match with message content
    """
    {
      "subject": "The subject of the message",
      "message": "The body of the message",
      "recipient_ids": "67129487",
      "message_status": "read"
    }
    """

  @acceptance
  Scenario: Delete a message
    Given I have the next endpoint "/messages"
      And I have a record already created with this content
        """
        {
          "subject": "The subject of the message",
          "message": "The body of the message",
          "recipient_ids": "67129487"
        }
        """
      And I have the next endpoint "/messages/inbox/:id"
    When I do an api DELETE request
    Then I should have 204 as status code
      And response body should match with empty content
    When I do an api GET request
    Then I should have 404 as status code