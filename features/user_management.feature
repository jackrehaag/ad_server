Feature: User management functionality

Scenario: Updating a user
Given There is a user
And I am signed in as an administrator
And I visit the edit user path
And I fill in the edit user form
And I click the "Update User" button
Then The user should be updated

Scenario: Listing users
Given There is a user
And I am signed in as an administrator
And I visit the users path
Then I should see the user listed