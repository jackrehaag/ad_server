Fabricator(:campaign) do
	name 'Test Campaign'
	budget 10000
	in_pause false
	start_date Date.today
	end_date Date.today + 1.year
	link 'http://rubyonrails.org/'
	country 'GB'
	creative File.new(Rails.root.join(
      "spec/fixtures/images/test-image.jpg"
    ))
end