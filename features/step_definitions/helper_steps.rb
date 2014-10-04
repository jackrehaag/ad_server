Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end

Given(/^I click the "(.*?)" button$/) do |arg1|
  click_button arg1
end

Given(/^I click the "(.*?)" link$/) do |arg1|
  click_link arg1
end