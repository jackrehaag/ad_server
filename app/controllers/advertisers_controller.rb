class AdvertisersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def new
		@advertiser = Advertiser.new
	end

	def create
		if current_user.role == "Administrator"
			@advertiser = Advertiser.new(advertiser_params)
		else
			@advertiser = current_user.advertisers.new(advertiser_params)
		end
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

	def destroy
		@advertiser = Advertiser.find(params[:id])
		if @advertiser.destroy
			flash[:notice] = 'Advertiser deleted'
		else
			flash[:error] = 'There was a problem deleting this advertiser'
		end
		redirect_to advertisers_path
	end

	protected

	def advertiser_params
		params.require(:advertiser).permit(:company, :first_name, :last_name, :email, :address, :city, :postcode, :country, :user_id)
	end
end