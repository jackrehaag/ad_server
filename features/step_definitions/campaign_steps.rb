Given(/^I fill in the new campaign form$/) do
  fill_in 'campaign_name', with: 'Test Campaign'
  fill_in 'campaign_budget', with: '10000'
  select "1", from: 'campaign_start_date_3i'
  select "January", from: 'campaign_start_date_2i'
  select "2014", from: 'campaign_start_date_1i'
  select "1", from: 'campaign_end_date_3i'
  select "January", from: 'campaign_end_date_2i'
  select "2015", from: 'campaign_end_date_1i'
  fill_in 'campaign_link', with: 'http://rubyonrails.org/'
  find('#campaign_country').find(:xpath, 'option[1]').select_option
  attach_file('campaign_creative', File.join(Rails.root, "spec/fixtures/images/test-image.jpg"))
end

Then(/^The campaign should be created$/) do
  expect(Campaign.all.count).to eq(1)
  expect(Campaign.first.name).to eq('Test Campaign')
end

Given(/^I have a campaign$/) do
  Fabricate(:campaign, advertiser_id: @advertiser.id)
end

Given(/^I visit the campaigns path$/) do
  visit campaigns_path
end