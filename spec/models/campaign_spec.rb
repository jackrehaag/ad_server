require 'rails_helper'

RSpec.describe Campaign, :type => :model do
	before do
		@advertiser = Fabricate(:advertiser)
	end

	it "validates that the start date is before the end date" do 
		@campaign = Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today, end_date: Date.today - 1.days)
		expect(@campaign).to have_errors
	end

	it "returns active campaigns" do 
		@campaign = Fabricate(:campaign, advertiser: @advertiser)
		expect(Campaign.active).to include(@campaign)
	end

  it "does not include paused campaigns as active" do 
  	@campaign = Fabricate(:campaign, advertiser: @advertiser, in_pause: true)
  	expect(Campaign.active).to not_include(@campaign)
  end

  it "does not include campaigns with a forthcoming start date as active" do 
  	@campaign = Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today + 1.day)
  	expect(Campaign.active).to not_include(@campaign)
  end

  it "does not include campaigns with a foregone end date as active" do 
  	@campaign = Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today - 2.months, end_date: Date.today - 1.months)
  	expect(Campaign.active).to not_include(@campaign)
  end
end
