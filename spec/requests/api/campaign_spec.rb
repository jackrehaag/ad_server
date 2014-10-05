require 'rails_helper'

RSpec.describe "Campaign API" do
	before do
		@user = Fabricate(:user)
		@advertiser = Fabricate(:advertiser, user: @user)
		
		Fabricate(:campaign, name: 'active campaign in GB', advertiser: @advertiser)
		Fabricate(:campaign, name: 'paused campaign in GB', advertiser: @advertiser, in_pause: true)

		Fabricate(:campaign, name: 'active campaign in france', advertiser: @advertiser, country: 'FR')
		Fabricate(:campaign, name: 'paused campaign in france', advertiser: @advertiser, country: 'FR', in_pause: true)
	end

  it 'returns all campaigns' do
    get '/api/campaigns'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].length).to eq(4)
  end

  it "returns all active campaigns" do 
  	get '/api/campaigns/active'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].count).to eq(2)
    expect(json['campaigns'].collect { |campaign| campaign['name']}).to eq(['active campaign in GB', 'active campaign in france'])
  end

  it "returns all GB campaigns" do 
  	get '/api/GB/campaigns'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].count).to eq(2)
    expect(json['campaigns'].collect { |campaign| campaign['name']}).to eq(['active campaign in GB', 'paused campaign in GB'])
  end

  it "returns all active GB campaigns" do 
  	get '/api/GB/campaigns/active'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].count).to eq(1)
    expect(json['campaigns'].collect { |campaign| campaign['name']}).to eq(['active campaign in GB'])
  end

end