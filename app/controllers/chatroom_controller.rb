class ChatroomController < ApplicationController
	before_action :require_user
	
	def index
		@messages = Message.all.order(updated_at: :desc)
	end
end