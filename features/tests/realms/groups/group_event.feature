# Created by Wanda Garron
Feature: Create operation for event in a group

  Background:
    Given I am authenticated as "instructor henry"
    And I have the next endpoint "/groups"
    And I have the body payload below
    """
    {
       "title": "My group for test event",
       "description": "Discuss new groups",
       "website": "",
       "picture_url": ""
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And I store the id of the group

  @acceptance
  Scenario: Create a new event
    Given I have the next endpoint "/groups/:id/event"
    And I have the body payload below
    """
    {
        "title": "My new event",
        "description": "My event description",
        "start": "2019-02-15 16:30:00",
        "has_end": "1",
        "end": "2019-02-15 18:30:00",
        "type": "event"
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And The response body should have an id

 @functional, @positive
  Scenario: Get all events for a group
    Given I have the next endpoint "/groups/:id/events"
    When I do an api GET request
    Then I should have 200 as status code
    And I should see the list of events on the group


