Feature: Authentication functionality

Scenario: User signup
Given I visit the user signup path
And I fill in the user signup form
And I click the 'Sign up' button
Then My user account should be created

Scenario: User sign in
Given I have a user account
And I visit the user sign in path
And I fill in the user sign in form
And I click the 'Sign in button'
Then I should see 'Signed in successfully'

Scenario: User sign out
Given I am signed in
And I click the 'Sign out' button
Then I should see 'Signed out successfully'