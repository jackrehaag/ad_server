class AdvertisersController < ApplicationController
	before_filter :authenticate_user!

	def new
		@advertiser = Advertiser.new
	end

	def create
		@advertiser = Advertiser.new(advertiser_params)
		if @advertiser.save
			flash[:success] = "Advertiser successfully created."
			redirect_to advertiser_path(@advertiser)
		else
			flash[:error] = "There was a problem creating this advertiser"
			render :new
		end
	end

	def show
		@advertiser = Advertiser.find(params[:id])
	end

	def index
		if current_user.role == 'Administrator'
			@advertisers = Advertiser.all
		else
			@advertisers = current_user.advertisers
		end
	end

	protected

	def advertiser_params
		params.require(:advertiser).permit(:company, :first_name, :last_name, :email, :address, :city, :postcode, :country)
	end
end