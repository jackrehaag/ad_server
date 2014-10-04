Feature: Permissions for Advertiser actions

Scenario: a user cannot see the delete link for advertisers
Given I am signed in
And I have an advertiser
And I visit the advertisers path
Then I should not see "Delete"

Scenario: a administrator can see the delete link for advertisers
Given I am signed in as an administrator
And There is a user
And The user has an advertiser
And I visit the advertisers path
Then I should see "Delete"