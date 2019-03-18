# Created by Jafeth Garcia at 2/23/2019
@acceptance
Feature: Projects
  As an admin
  I want to do the main CRUD operations with projects resources
  So non 4XX code should be displayed

  Background:
    Given I am authenticated as "admin"
#    And I have the next endpoint "projects"

#  Scenario: Create a new project
#    Given I have the next endpoint "projects"
#    And I have the body payload below
#    """
#    {
#      "name":":randomName"
#    }
#    """
#    When I do an api POST request
#    Then I should have 200 as status code
#    And The response body should have an id


  Scenario: Edit a new project
    Given I have the next endpoint "projects"
    And I have a record already created with this content
    """
    {
      "name":":randomName",
      "project_type":"public"
    }
    """
    And I have the next endpoint "projects/:id"
    And I have the body payload below
    """
    {
      "name":":randomName"
    }
    """
    When I do an api PUT request
    Then I should have 200 as status code
    And The response body should have an id
    And response body should match with content
    """
    {
      "name":":randomName",
      "atom_enabled": false,
      "automatic_planning": true
    }
    """
