Feature: Advertiser functionality

Scenario: Creating an advertiser
Given I am signed in
And I visit the new advertisers path
And I fill in the new advertiser form
And I click the "Create Advertiser" button
Then My advertiser should be created
And I should see "Advertiser successfully created"

Scenario: Listing advertisers
Given I am signed in
And I have an advertiser
And I visit the advertisers path
Then I should see "Test Advertiser"

Scenario: Deleting advertisers
Given I am signed in as an administrator
And There is a user
And The user has an advertiser
And I visit the advertisers path
And I click the "Delete" link
Then There should be 0 advertisers

Scenario: Creating an advertiser for another user
Given I am signed in as an administrator
And There is a user
And I visit the new advertisers path
And I fill in the new advertiser form
And I select the advertisers user
And I click the "Create Advertiser" button
Then The user should have 1 advertisers
And I should see "Advertiser successfully created"