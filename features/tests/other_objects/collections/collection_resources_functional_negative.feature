# Created by Jafeth Garcia at 2/23/2019
Feature: Functional operations to confirm negative results over Resources

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

  @functional, @other_objects, @resources, @negative
  Scenario: Cannot create a new resource with missing attachments for a collection
    Given I have the next endpoint "/collections/:id/resources"
    And I have the body payload below
    """
    {
      "title": "Automation File",
      "type": "document",
      "resource_notes": "A handy automation file for collections."
    }
    """
    When I do an api POST request
    Then I should have 400 as status code
    And The response body should have the text "Debe adjuntar exactamente un archivo o enlace para crear un documento."

  @functional, @other_objects, @resources, @negative
  Scenario: Cannot create a new resource with invalid attachment for a collection
    Given I have the next endpoint "/collections/:id/resources"
    And I have the body payload below
    """
    {
      "title": "Automation File",
      "type": "document",
      "resource_notes": "A handy automation file for collections.",
      "attachments": [
        {
          "invalid_link": "www.google.com"
        }
      ]
    }
    """
    When I do an api POST request
    Then I should have 400 as status code
    And The response body should have the text "Debe adjuntar exactamente un archivo o enlace para crear un documento."
