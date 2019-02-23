# Author: Naira Romero

Feature: Create a Course
  As a teacher I want to create a Course so that I am enable to administrate the course

  Scenario: Create a Matematic course with nivel 3
    Given I have this endpoint "/courses"
    And I have the data below
    """
    {
        "title": "English Writing",
        "course_code": "E101",
        "department": "English",
        "description": "Essay Writing"
    }
    """
    When I do an api POST request
    Then I should have a new course with name equals to 'course_tes1'


