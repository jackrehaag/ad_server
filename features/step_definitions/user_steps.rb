Then(/^There should be (\d+) users$/) do |arg1|
  expect(User.all.count).to eq(arg1.to_i)
end