require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
		@user = User.create!(email: "craig@example.com", username: "Craig", password: "password")
		@user2 = User.create!(email: "test@example.com", username: "Test Man", password: "password")
		@message = Message.create(content: "This is the message!", user: @user)
		@message2 = Message.create(content: "Another message", user: @user2)
	end

	test "message should be valid" do
		assert @message.valid?
		assert @message2.valid?
	end

	test "message must have user" do
		@message.user = nil
		assert_not @message.valid?
	end

	test "message content cannot be empty" do
		@message2.content = ""
		assert_not @message2.valid?
	end 
end
