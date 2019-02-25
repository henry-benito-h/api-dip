# Created by Henry Benito at 2/23/2019
@messages
Feature: Messages
  As an instructor I want to do basic operation with message endpoints

  Background:
    Given I am authenticated as "instructor"
    And I get a random user id from the list

  @acceptance @bvt
  Scenario: Create a message
    Given I have the next endpoint "/messages"
    And I have the body payload below
    """
    {
      "subject": "The subject of the message",
      "message": "The body of the message",
      "recipient_ids": ":random_user_id"
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
      And response body should match with content
      """
      {
        "subject": "The subject of the message",
        "recipient_ids": ":random_user_id",
        "mid": null,
        "author_id": :my_id,
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
          "recipient_ids": ":random_user_id"
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
      "recipient_ids": ":random_user_id",
      "author_id": :my_id,
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
          "recipient_ids": ":random_user_id"
        }
        """
      And I have the next endpoint "/messages/inbox/:id"
    When I do an api DELETE request
    Then I should have 204 as status code
      And response body should match with empty content
    When I do an api GET request
    Then I should have 404 as status code