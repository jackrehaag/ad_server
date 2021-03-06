Given(/^I visit the user signup path$/) do
  visit new_user_registration_path
end

Given(/^I fill in the user signup form$/) do
  fill_in 'user_first_name', with: 'Test'
  fill_in 'user_last_name', with: 'account'
  fill_in 'user_email', with: 'test@example.com'
  fill_in 'user_password', with: 'test_password'
end

Then(/^My user account should be created$/) do
  expect(User.all.count).to eq(1)
  expect(User.first.email).to eq('test@example.com')
end

Given(/^I have a user account$/) do
  @user = Fabricate(:user)
end

Given(/^I have an administrator user account$/) do
  @administrator_user = Fabricate(:administrator_user)
end

Given(/^I visit the user sign in path$/) do
  visit new_user_session_path
end

Given(/^I fill in the user sign in form$/) do
  fill_in 'user_email', with: 'test@example.com'
  fill_in 'user_password', with: 'test_password'
end

Given(/^I fill in the user sign in form as an administrator$/) do
  fill_in 'user_email', with: 'administrator@example.com'
  fill_in 'user_password', with: 'test_password'
end

Given(/^I am signed in as an administrator$/) do
  step 'I have an administrator user account'
  step 'I visit the user sign in path'
  step 'I fill in the user sign in form as an administrator'
  step 'I click the "Sign in" button'
  step 'I should see "Signed in successfully"'
end

Given(/^I am signed in$/) do
  step 'I have a user account'
  step 'I visit the user sign in path'
  step 'I fill in the user sign in form'
  step 'I click the "Sign in" button'
  step 'I should see "Signed in successfully"'
end

Given(/^There is a user$/) do
  step 'I have a user account'
end