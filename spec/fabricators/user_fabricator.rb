Fabricator(:user) do
	first_name 'Test'
  last_name 'account'
  email 'test@example.com'
  password 'test_password'
end

Fabricator(:administrator_user, class_name: 'User') do
	first_name 'Test'
  last_name 'Adminidtrator'
  email 'administrator@example.com'
  password 'test_password'
  role 'Administrator'
end