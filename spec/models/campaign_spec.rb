require 'rails_helper'

RSpec.describe Campaign, :type => :model do
	before do
		@advertiser = Fabricate(:advertiser)
	end

	it "validates that the start date is before the end date" do 
		expect { Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today, end_date: Date.today - 1.days) }.to raise_error
	end

	it "returns true for active campaigns" do 
		@campaign = Fabricate(:campaign, advertiser: @advertiser)
		expect(@campaign.active?).to eq(true)
	end

  it "does not include paused campaigns as active" do 
  	@campaign = Fabricate(:campaign, advertiser: @advertiser, in_pause: true)
  	expect(@campaign.active?).to eq(false)
  end

  it "does not include campaigns with a forthcoming start date as active" do 
  	@campaign = Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today + 1.day)
  	expect(@campaign.active?).to eq(false)
  end

  it "does not include campaigns with a foregone end date as active" do 
  	@campaign = Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today - 2.months, end_date: Date.today - 1.months)
  	expect(@campaign.active?).to eq(false)
  end

  it "includes active campaigns in the scope" do 
    @campaign = Fabricate(:campaign, advertiser: @advertiser)
    expect(Campaign.active).to include(@campaign)
  end

  it "does not include paused campaigns in the active scope" do 
    @campaign = Fabricate(:campaign, advertiser: @advertiser, in_pause: true)
    expect(Campaign.active).not_to include(@campaign)
  end

  it "does not include upcoming campaigns in the active scope" do 
    @campaign = Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today + 1.day)
    expect(Campaign.active).not_to include(@campaign)
  end

  it "does not include past campaigns in the active scope" do 
    @campaign = Fabricate(:campaign, advertiser: @advertiser, start_date: Date.today - 2.months, end_date: Date.today - 1.months)
    expect(Campaign.active).not_to include(@campaign)
  end
end
