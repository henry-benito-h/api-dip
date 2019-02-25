# Created by Henry Benito at 2/23/2019
@messages @functional
Feature: Messages
  As an instructor I want to do basic operation with message endpoints

  Background:
    Given I am authenticated as "instructor"
      And I get a random user id from the list

  @positive
  Scenario: A message is created without a message
    Given I have the next endpoint "/messages"
      And I have the body payload below
    """
    {
      "subject": "The subject of the message",
      "message": "",
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
        "message": ""
      }
      """

  @negative
  Scenario: A message is not created without a subject
    Given I have the next endpoint "/messages"
      And I have the body payload below
      """
      {
        "subject": "",
        "message": "The body of the message",
        "recipient_ids": "69824113"
      }
      """
    When I do an api POST request
    Then I should have 400 as status code
      And The response body should have the text "You must enter a message subject"

  @negative
  Scenario Outline: A message is not created without valid recipients
    Given I have the next endpoint "/messages"
      And I have the body payload below
      """
      {
        "subject": "Some subject",
        "message": "Message content",
        "recipient_ids": "<recipients_ides>"
      }
      """
    When I do an api POST request
    Then I should have 400 as status code
      And The response body should have the text "Some or all of the recipients you entered are invalid"
    Examples:
      | recipients_ides |
      |                 |
      | Le canard       |
      | 69824HB         |
