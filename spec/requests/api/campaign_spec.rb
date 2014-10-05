require 'rails_helper'

RSpec.describe "Campaign API" do
	before do
		@user = Fabricate(:user)
		@advertiser = Fabricate(:advertiser, user: @user)
		
		Fabricate(:campaign, name: 'active campaign in uk', advertiser: @advertiser)
		Fabricate(:campaign, name: 'paused campaign in uk', advertiser: @advertiser, in_pause: true)

		Fabricate(:campaign, name: 'active campaign in france', advertiser: @advertiser, country: 'FR')
		Fabricate(:campaign, name: 'paused campaign in france', advertiser: @advertiser, country: 'FR', in_pause: true)
	end

  it 'returns all campaigns' do
    get '/api/campaigns'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].count).to eq(4)
  end

  it "returns all active campaigns" do 
  	get '/api/campaigns/active'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].count).to eq(2)
    expect(json['campaigns'].collect { |campaign| campaign['name']}).to eq(['active campaign in uk', 'active campaign in france'])
  end

  it "returns all uk campaigns" do 
  	get '/api/UK/campaigns'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].count).to eq(2)
    expect(json['campaigns'].collect { |campaign| campaign['name']}).to eq(['active campaign in uk', 'paused campaign in uk'])
  end

  it "returns all active uk campaigns" do 
  	get '/api/UK/campaigns'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['campaigns'].count).to eq(1)
    expect(json['campaigns'].collect { |campaign| campaign['name']}).to eq(['active campaign in uk'])
  end

end