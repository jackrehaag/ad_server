Given(/^I visit the edit user path$/) do
  visit edit_user_path(@user)
end

Given(/^I fill in the edit user form$/) do
  fill_in 'user_email', with: 'new-email@example.com'
end

Then(/^The user should be updated$/) do
	@user.reload
  expect(@user.email).to eq('new-email@example.com')
end

Given(/^I visit the users path$/) do
  visit users_path
end

Then(/^I should see the user listed$/) do
  expect(page).to have_content 'test@example.com'
end

Given(/^I fill in the users password fields$/) do
  fill_in 'user_password', with: 'new_password'
  fill_in 'user_password_confirmation', with: 'new_password'
end

Then(/^The users password should of changed$/) do
  expect(@user.valid_password?('new_password')).to be_truthy
end

Given(/^I fill in the users password fields with an incorrect confirmation$/) do
  fill_in 'user_password', with: 'new_password'
  fill_in 'user_password_confirmation', with: 'not_the_new_password'
end