class ChatroomController < ApplicationController
	before_action :require_user

	def index
		@message = Message.new
		@messages = Message.all.order(updated_at: :desc).first(20)
	end
end