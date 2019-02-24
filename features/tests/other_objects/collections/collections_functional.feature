# Created by Jafeth Garcia at 2/23/2019
Feature: Read, Update and Delete operation over Resource Collections

  Background:
    Given I have the next endpoint "/collections"
    And I have the body payload below
    """
    {
      "title": "Functional_Collection"
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And I store the id of the collection

  @functional, @other_objects, @positive
  Scenario: Read an existing resource collection
    Given I have the next endpoint "/collections/:id"
    When I do an api GET request
    Then I should have 200 as status code
    And I should see the collection created matching with the one created

  @functional, @other_objects, @positive
  Scenario: Update an existing resource collection
    Given I have the next endpoint "/collections/:id"
    And I have the body payload below
    """
    {
      "title": "Functional_Collection_Updated"
    }
    """
    When I do an api PUT request
    Then I should have 204 as status code

  @functional, @other_objects, @positive
  Scenario: Delete an existing resource collection
    Given I have the next endpoint "/collections/:id"
    When I do an api DELETE request
    Then I should have 204 as status code
    And I have the next endpoint "/collections/:id"
    When I do an api GET request
    Then I should have 403 as status code
