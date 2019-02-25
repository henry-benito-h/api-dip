#Author: Naira Romero
Feature: Try to create a album with invalid inputs
  As a teacher I'm unable to create an Album with required inputs empty.
  @negative, @album
  Scenario: Try to create an album without filling in the required fields(title)
    Given I have the next endpoint "/groups/1984975962/albums"
    And I have the body payload below
     """
        {
          "title": "",
          "description": "this is new api media album",
          "setting_comments": "1",
          "setting_member_post": "6",
          "published": "6"
        }
    """
    When I do an api POST request
    Then I should have 400 as status code
    And I should not be enable to create a new album because the required fields empty

