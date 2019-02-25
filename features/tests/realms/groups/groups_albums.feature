#Author: Naira Romero
  Feature: Create an album in a group

    @acceptance, @positive
    Scenario: Create an album with required fields
      Given I have the next endpoint "/groups/1985022273/albums"
      And I have the body payload below
        """
        {
          "title": "This album was created through api 008",
          "description": "this is new api media album",
          "setting_comments": "1",
          "setting_member_post": "6",
          "published": "6"
        }
        """
      When I do an api POST request
      Then I should have 201 as status code
      And The response body should have an title equals to one created
