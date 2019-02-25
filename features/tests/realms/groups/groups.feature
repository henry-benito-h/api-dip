# Created by Wanda Garron
Feature: Create operation for group
  We will perform basic CRUD operation over groups
  Background:
    Given I am authenticated as "instructor henry"

  @acceptance
  Scenario: Create a new group
    Given I have the next endpoint "/groups"
    And I have the body payload below
    """
    {
       "title": "My new group for test",
       "description": "Discuss new groups",
       "website": "",
       "picture_url": ""
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And  I store the id of the group
    And The response body should have an id
