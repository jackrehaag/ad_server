Feature: Campaign Functionality

Scenario: Adding a new campaign
Given I am signed in
And I have an advertiser
And I visit the advertiser path
And I click the "Add campaign" link
And I fill in the new campaign form
And I click the "Create Campaign" button
Then The campaign should be created
And I should see "Campaign successfully created"

Scenario: Listing an advertisers campaigns
Given I am signed in
And I have an advertiser
And I have a campaign
And I visit the advertiser path
Then I should see "Test Campaign"

Scenario: Listing all campaigns
Given I am signed in
And I have an advertiser
And I have a campaign
And I visit the campaigns path
Then I should see "Test Campaign"

Scenario: Deleting a campaign
Given I am signed in as an administrator
And There is a user
And The user has an advertiser
And The user has a campaign
And I visit the campaigns path
And I click the "Delete" link
Then There should be 0 campaigns