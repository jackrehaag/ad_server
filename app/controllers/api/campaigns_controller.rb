class Api::CampaignsController < ApplicationController
	def index
		if params[:country]
			@campaigns = { campaigns: Campaign.where(country: params[:country]) }
		else
			@campaigns = { campaigns: Campaign.all }
		end
		render json: @campaigns
	end

	def active
		if params[:country]
			@campaigns = { campaigns: Campaign.active.where(country: params[:country]) }
		else
			@campaigns = { campaigns: Campaign.active }
		end
		render json: @campaigns
	end
end