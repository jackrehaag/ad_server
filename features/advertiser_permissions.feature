Feature: Permissions for Advertiser actions

Scenario: a user cannot see the delete link for advertisers
Given I am signed in
And I have an advertiser
And I visit the advertisers path
Then I should not see the advertiser delete link

Scenario: a administrator can see the delete link for advertisers
Given I am signed in as an administrator
And I have an advertiser
And I visit the advertisers path
Then I should see the advertiser delete link