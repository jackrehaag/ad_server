class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
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

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = 'User deleted.'
		else
			flash[:error] = 'There was a problem deleting this user.'
		end
		redirect_to users_path
	end

	protected
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
	end

	def user_update_method
		if user_params[:password].blank?
      :update_without_password
    else
    	:update_attributes
    end
	end
end