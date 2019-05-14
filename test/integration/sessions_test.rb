require 'test_helper'

class SessionsTest < ActionDispatch::IntegrationTest
  def setup
  	@user = User.create!(username: "Craig", email: "craig@test.com", password: "password")
  end

  test "reject invalid login attempt" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: { session: {email: "fred@test.com", password: "password"} }
  	assert_template 'sessions/new'
  	# Should flash an error message
  	assert_not flash.empty?
  end

  test "accept valid login attempt" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: { session: {email: "craig@test.com", password: "password"} }
  	follow_redirect!
  	assert_template 'chatroom/index'
  	# Should be a success message
  	assert_not flash.empty?
  	# Should be a logout path now, and should not be login path
  	assert_select "a[href=?]", logout_path
  	assert_select "a[href=?]", login_path, count: 0
  end

  test "reject home path if not logged in" do
  	get root_path
  	follow_redirect!
  	assert_template 'sessions/new'
  	# Should be a error message
  	assert_not flash.empty?
  end

  test "should logout ok and return to login page" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: { session: {email: "craig@test.com", password: "password"} }
  	follow_redirect!
  	assert_template 'chatroom/index'
  	# Should be a success message
  	assert_not flash.empty?
  	# Should be a logout path now, and should not be login path
  	assert_select "a[href=?]", logout_path
  	delete logout_path
  	follow_redirect!
  	assert_template 'sessions/new'
  	assert_not flash.empty?
  end
end
