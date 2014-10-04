Given(/^I have an advertiser$/) do
  Fabricate(:advertiser, user_id: @user.id)
end

Given(/^I visit the advertisers path$/) do
  visit advertisers_path
end

Given(/^I visit the new advertisers path$/) do
  visit new_advertiser_path
end

Given(/^I fill in the new advertiser form$/) do
  fill_in :company, with: 'Test Company'
  fill_in :first_name, with: 'Test'
  fill_in :last_name, with: 'Advertiser'
  fill_in :email, with: 'testing@example.com'
  fill_in :address, with: '1 street way'
  fill_in :city, with: 'London'
  fill_in :postcode, with: 'SW1A 1AA'
  select 'United Kingdom', from: :country
end

Then(/^My advertiser should be created$/) do
  expect(Advertiser.all.count).to eq(1)
  expect(Advertiser.first.company).to eq('Test Company')
end

Then(/^There should be (\d+) advertisers$/) do |arg1|
  expect(Advertiser.all.count).to eq(arg1)
end

Given(/^The user has an advertiser$/) do
  step 'I have an advertiser'
end