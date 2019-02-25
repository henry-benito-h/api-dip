Feature: Read a event
  @functional, @negative
  Scenario: Cannot create a new event with missing group id
    Given I have the next endpoint "/groups/1111111/events"
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
    Then I should have 403 as status code
