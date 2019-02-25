# Author: Naira Romero

Feature: Create a Course
  As a teacher I want to create a Course so that I am enable to administrate the course


  Scenario: Create a Matematic course with nivel 3
    Given I have the next endpoint "/courses"
    And I have the body payload below
    """
    {
        "title": "English Reading103",
        "course_code": "NREe103",
        "department": "English",
        "description": "Essay Reading"
    }
    """
    When I do an api POST request
    Then I should have 201 as status code
    And I should have a new course with name equals to 'course_tes1'


