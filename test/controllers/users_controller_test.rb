# frozen_string_literal: true

require('test_helper')

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = login!
  end

  test 'should get new' do
    get '/signup'
    assert_response :success
  end

  test 'should create user' do
    data = ::TEST_USER_DATA.dup
    data[:username] = 'test'
    data[:email] = 'example@mail.com'
    assert_difference('User.count') do
      post users_url, params: { user: data }
    end

    assert_redirected_to login_path
  end

  test 'should show user' do
    login!
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    login!
    get edit_user_url(User.find_by(email: TEST_SESSION_DATA[:username]))
    assert_response :success
  end

  test 'should update user' do
    login!
    patch user_url(@user), params: { user: { password: 'new_pass' } }
    assert_redirected_to user_url(@user)
  end
end
