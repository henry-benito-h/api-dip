#Author : Naira Romero
Feature: Create a course section
As a teacher  I want to create a new section on a course so that I can I can organize the course in different section
 Background:
   Given I have the next endpoint "/courses"
   And I have the body payload below
    """
    {
        "title": "English Reading18",
        "course_code": "NREe108",
        "department": "English",
        "description": "Essay Reading"
    }
    """
   When I do an api POST request
   Then I should have 201 as status code
   And I store the id of the course
   @naira
  Scenario: Create a section in a course with valid inputs
    Given I have the next endpoint "/courses/:id/sections"
    And I have the body payload below
    """
    {
      "title": "Section 3",
      "description": "Section 1 Math",
      "section_code": "36",
      "grading_periods": [
          13221,
          2344,
          1246
      ]
    }
    """
    When I do an api POST request
    Then I should have 400 as status code
    And I should have a new section code in the course that matches with the one created

