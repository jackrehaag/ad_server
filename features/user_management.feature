Feature: User management functionality

Scenario: Updating a user
Given There is a user
And I am signed in as an administrator
And I visit the edit user path
And I fill in the edit user form
And I click the "Update User" button
Then The user should be updated
And I should see "User successfully updated"

Scenario: Updating a users password
Given There is a user
And I am signed in as an administrator
And I visit the edit user path
And I fill in the edit user form
And I fill in the users password fields
And I click the "Update User" button
Then The user should be updated
And I should see "User successfully updated"
And The users password should of changed

Scenario: Attempting to updating a users password with an incorrect confirmation
Given There is a user
And I am signed in as an administrator
And I visit the edit user path
And I fill in the edit user form
And I fill in the users password fields with an incorrect confirmation
And I click the "Update User" button
Then I should see "Password confirmation doesn't match Password"

Scenario: Listing users
Given There is a user
And I am signed in as an administrator
And I visit the users path
Then I should see the user listed