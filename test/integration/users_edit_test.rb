require 'test_helper'
class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "k.com",
                                              password:             "kkk",
                                              password_confirmation: "QQQ"}}
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    # log_in_as(@user)
    # get edit_user_path(@user)
    # assert_template 'users/edit'
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "stronger_Evan"
    email = "stronger_Evan@gmail.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert name, @user.name
    assert email, @user.email
  end
end
