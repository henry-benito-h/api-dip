#Author: Naira Romero

  Feature: Get, Update and Delete an album from a group
    Background:
      Given I have the next endpoint "/groups/1984940728/albums"
      # groups ID: 985058640,1985060180, 1985061109
      And I have the body payload below
        """
        {
          "title": "This album was created through api 1456",
          "description": "this is new api media album",
          "setting_comments": "1",
          "setting_member_post": "1",
          "published": "1"
        }
        """
      When I do an api POST request
      Then I store the id of an Album

      @functional, @positive, @album67
    Scenario: Get an exisiting album
      Given I have the next endpoint "/groups/1984940728/albums/:id"
      When I do an api GET request
      Then I should have 200 as status code
      And I should see the info of the album created matching with the one created

    @functional, @positive, @album67
    Scenario: Update existing album
      Given I have the next endpoint "/groups/1984940728/:id"
      And I have the body payload below
        """
        {
          "description": "this is new api media album Update",
          "setting_comments": "1"
        }
        """
      When I do an api PUT request
      Then I should have 204 as status code

    @functional, @positive, @album67
    Scenario: Get all albunes from group
      Given I have the next endpoint "/groups/1984940728/albums"
      When I do an api GET request
      Then I should have 200 as status code
      And I should see the list of events on the group

    @functional, @positive, @album67
    Scenario: Delete an existing album from a course
      Given I have the next endpoint "/groups/1984940728/:id"
      When I do an api DELETE request
      Then I should have 204 as status code
      And I have the next endpoint "/groups/1984940728/:id"
      When I do an api GET request
      Then I should have 403 as status code
