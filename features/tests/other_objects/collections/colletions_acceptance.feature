# Created by Jafeth Garcia at 2/23/2019
Feature: Create operations on Resource Collections
  We will perform basic CRUD operation over resource collections

  @acceptance, @other_objects
  Scenario: Create a new resource collection
    Given I have the next endpoint "/collections"
    And I have the body payload below
    """
    {
      "title": "Automation Resource"
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And The response body should have an id
