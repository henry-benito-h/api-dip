#Author: Naira Romero
Feature: Try to create a courses with invalid inputs
  As a teacher I'm unable to create a Course with required inputs empty and with course code already existing

  @test, @negative456
  Scenario: Try to create a course without filling in the required fields(title and course code)
    Given I have the next endpoint "/courses"
    And I have the body payload below
    """
    {
        "title": "",
        "course_code": "",
        "department": "English",
        "description": "Essay Reading"
    }
    """
    When I do an api POST request
    Then I should have 400 as status code
    And I should not be enable to create a new course because the required fields empty
