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
    And The response body should have an id

      @functional, @positive
  Scenario: Read an existing Group
    Given I have the next endpoint "/groups/:id"
    When I do an api GET request
    Then I should have 200 as status code
    And I should see the group created matching with the one created

  @functional, @positive
  Scenario: Update an existing group
    Given I have the next endpoint "/groups/:id"
    And I have the body payload below
    """
    {
      "title": "Functional Group Updated",
      "picture_url": ""
    }
    """
    When I do an api PUT request
    Then I should have 204 as status code


  @functional, @positive
  Scenario: Delete an existing group
    Given I have the next endpoint "/groups/:id"
    When I do an api DELETE request
    Then I should have 204 as status code
    And I have the next endpoint "/groups/:id"
    When I do an api GET request
    Then I should have 403 as status code


  @functional, @negative
  Scenario: Cannot read a non existing group
    Given I have the next endpoint "/groups/123456789"
    When I do an api GET request
    Then I should have 403 as status code