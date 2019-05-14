class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:positive] = "Welcome back, #{user.username}"
			redirect_to root_path
		else
			flash.now[:negative] = "Invalid Email or Password entered"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:positive] = "You have successfully logged out"
		redirect_to root_path
	end
end