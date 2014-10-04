class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if user_params[:password].blank?
      user_update_method = :update_without_password
    else
    	user_update_method = :update_attributes
    end
		if @user.send(user_update_method, user_params)
			flash[:success] = 'User successfully updated.'
			redirect_to users_path
		else
			flash[:error] = 'There was a problem updating this user.'
			render :edit
		end
	end

	def index
		@users = User.all
	end

	protected
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
	end
end