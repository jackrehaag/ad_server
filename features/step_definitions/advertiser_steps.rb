Given(/^I have an advertiser$/) do
  @advertiser = Fabricate(:advertiser, user_id: @user.id)
end

Given(/^I visit the advertisers path$/) do
  visit advertisers_path
end

Given(/^I visit the advertiser path$/) do
  visit advertiser_path(@advertiser)
end

Given(/^I visit the new advertisers path$/) do
  visit new_advertiser_path
end

Given(/^I fill in the new advertiser form$/) do
  fill_in 'advertiser_company', with: 'Test Company'
  fill_in 'advertiser_first_name', with: 'Test'
  fill_in 'advertiser_last_name', with: 'Advertiser'
  fill_in 'advertiser_email', with: 'testing@example.com'
  fill_in 'advertiser_address', with: '1 street way'
  fill_in 'advertiser_city', with: 'London'
  fill_in 'advertiser_postcode', with: 'SW1A 1AA'
  find('#advertiser_country').find(:xpath, 'option[1]').select_option
end

Then(/^My advertiser should be created$/) do
  expect(Advertiser.all.count).to eq(1)
  expect(Advertiser.first.company).to eq('Test Company')
end

Then(/^There should be (\d+) advertisers$/) do |arg1|
  expect(Advertiser.all.count).to eq(arg1.to_i)
end

Given(/^The user has an advertiser$/) do
  step 'I have an advertiser'
end