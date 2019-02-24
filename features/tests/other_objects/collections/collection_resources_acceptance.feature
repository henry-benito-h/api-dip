# Created by Jafeth Garcia at 2/23/2019
Feature: Create operation for resource over a Collection

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

  @acceptance, @other_objects, @resources
  Scenario: Create a new resource for a collection
    Given I have the next endpoint "/collections/:id/resources"
    And I have the body payload below
    """
    {
      "title": "Automation File",
      "type": "document",
      "resource_notes": "A handy automation file for collections.",
      "attachments": [
        {
          "url": "www.google.com"
        }
      ]
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And The response body should have an id
