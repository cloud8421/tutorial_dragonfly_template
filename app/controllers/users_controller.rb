class UsersController < ApplicationController

	before_filter :get_user, only: [:show, :edit]

	def index
		@users = User.all
	end

	def show; end

	def edit; end

	def update
		@user = User.find_by_id(params[:id])
		if @user
			if @user.update_attributes(params[:user])
				flash[:success] = 'User updated'
				redirect_to user_path(@user)
			else
				flash[:error] = 'Validation errors'
				render :edit
			end
		else
			flash[:error] = 'Invalid user id'
			redirect_to root_path
		end
	end

	private

	def get_user
		@user = User.find_by_id(params[:id])
		unless @user
			flash[:error] = 'Invalid user id'
			redirect_to root_path
		end
	end

end