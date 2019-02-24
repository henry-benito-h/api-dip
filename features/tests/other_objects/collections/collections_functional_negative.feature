# Created by Jafeth Garcia at 2/23/2019
Feature: Functional operations to confirm negative results over Collections

  @functional, @other_objects, @negative
  Scenario: Cannot read a non existing resource collection
    Given I have the next endpoint "/collections/1111111"
    When I do an api GET request
    Then I should have 403 as status code
