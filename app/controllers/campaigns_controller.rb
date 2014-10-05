class CampaignsController < ApplicationController
	def new
		@advertiser = Advertiser.find(params[:advertiser_id])
		@campaign = @advertiser.campaigns.new
	end

	def create
		@advertiser = Advertiser.find(params[:advertiser_id])
		@campaign = @advertiser.campaigns.new(campaign_params)
		if @campaign.save
			flash[:success] = "Campaign successfully created."
			redirect_to advertiser_path(@advertiser)
		else
			flash[:error] = "There was a problem creating this campaign."
			render :new
		end
	end

	def index
		if current_user.role == 'Administrator'
			@campaigns = Campaign.all
		else
			@campaigns = current_user.campaigns
		end
	end

	protected
	def campaign_params
		params.require(:campaign).permit(:name, :budget, :start_date, :end_date, :in_pause, :link, :country, :creative, :advertiser_id)
	end
end