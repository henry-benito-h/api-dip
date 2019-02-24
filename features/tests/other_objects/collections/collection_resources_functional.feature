# Created by Jafeth Garcia at 2/23/2019
Feature: Read, Update and Delete operation for resource over a Collection

  Background:
    Given I have the next endpoint "/collections"
    And I have the body payload below
    """
    {
      "title": "Auto_Collection"
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And I store the id of the collection
    Given I have the next endpoint "/collections/:id/resources"
    And I have the body payload below
    """
    {
      "title": "Functional File",
      "type": "document",
      "resource_notes": "A functional file for collections.",
      "attachments": [
        {
          "url": "www.automation.com"
        }
      ]
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And I store the id of the resource

  @functional, @other_objects, @positive, @resources
  Scenario: Read all existing resources on a collection
    Given I have the next endpoint "/collections/:id/resources"
    When I do an api GET request
    Then I should have 200 as status code
    And I should see the list of resources on the collection