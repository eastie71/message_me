class MessagesController < ApplicationController
	before_action :require_user

	def create
		@message = Message.new(message_params)
		@message.user = current_user
		if @message.save
			ActionCable.server.broadcast "chatroom_channel", message_content: message_render(@message)
		end
	end

	private
		def message_params
			params.require(:message).permit(:content)
		end

		def message_render(message)
			# calling the _message partial file passing the message object
			render(partial: 'message', locals: {message: message})
		end
end