Given(/^I fill in the new campaign form$/) do
  fill_in 'campaign_name', with: 'Test Campaign'
  fill_in 'campaign_budget', with: '10000'
  select '1/1/2015', from: 'campaign_start_date'
  select '31/12/2015', from: 'campaign_end_date'
  fill_in 'campaign_link', with: 'http://github.com'
  find('#campaign_country').find(:xpath, 'option[1]').select_option
  attach_file('campaign_creative', '/spec/fixtures/images/test-image.jpg')
end

Then(/^The campaign should be created$/) do
  expect(Campaign.all.count).to eq(1)
  expect(Campaign.first.name).to eq('Test Campaign')
end

Given(/^I have a campaign$/) do
  Fabricate(:campaign, advertiser_id: @advertiser.id)
end