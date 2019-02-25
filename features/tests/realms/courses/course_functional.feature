#Author : Naira Romero
Feature:  Update, read and delete courses
  Background:
   Given I have the next endpoint "/courses"
   And I have the body payload below
    """
    {
        "title": "Literature 119",
        "course_code": "NRE0151",
        "department": "English",
        "description": "Essay Reading"
    }
    """
   When I do an api POST request
   Then I should have 201 as status code
   And I save the id of the course

    @functional, @positive
   Scenario: Update the information of a course already created
    Given I have the next endpoint "/courses/:id"
    And I have the body payload below
     """
     {
         "title": "Course_updatedp",
         "course_code": "NRET15",
         "department": "Updating_English",
         "description": "UpdatingEssay Reading",
         "course_name": "aaa"
     }
     """
    When I do an api PUT request
    Then I should have 204 as status code

    @functional, @positive
   Scenario: Delete an existing course
     Given I have the next endpoint "/courses/:id"
     When I do an api DELETE request
     Then I should have 204 as status code

   @functional, @positive
   Scenario: Get the courses and their related information of an specific school
     Given I have the next endpoint "/courses"
     When I do an api GET request
     Then I should have 200 as status code