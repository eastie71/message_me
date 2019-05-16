class UsersController < ApplicationController
	before_action :not_logged_in, only: [:new, :create]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:positive] = "Welcome to MessageMe #{@user.username}"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
		
		def not_logged_in
			if logged_in?
				flash[:negative] = "You must be logged out to sign-up a new user"
				redirect_to root_path
			end
		end
end