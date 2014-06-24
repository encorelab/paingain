require 'test_helper'
class Admin::UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:admin)
    sign_in @user
  end

  def test_index
    get :index
    assert_response :success
    assert_template :index
  end

  def test_show
    user = users(:default)
    get :show, id: user.id
    assert_response :success
    assert_template :show
    assert_equal user.id, assigns(:user).id
  end

  def test_show_failure
    get :show, id: 23
    assert_response :redirect
    assert_redirected_to admin_users_path
  end

  def test_new
    get :new
    assert_response :success
    assert_template :new
    assert assigns(:user)
  end

  def test_edit
    user = users(:default)
    get :edit, id: user.id
    assert_response :success
    assert_template :edit
  end

  def test_update
    user = users(:default)
    put :update, id: user.id, user: {
      email: 'updated@test.com'
    }
    assert_redirected_to edit_admin_user_path(user.id)
    user.reload
    assert_equal 'updated@test.com', user.email
  end

  def test_update_failure
    user = users(:default)
    put :update, id: user.id, user: {
      email: ''
    }
    assert_response :success
    assert_template :edit
  end

  def test_create
    group = groups(:default)
    assert_difference "User.count" do
      post :create, user: {
        email: 'create@test.com',
        password: 'password',
        group_id: group.id,
        role: 'user'
      }
    end
    assert_redirected_to admin_users_path
  end

  def test_create_failure
    assert_no_difference "User.count" do
      post :create, user: {}
    end
    assert_response :success
    assert_template :new
  end

  def test_destroy
    user = users(:default)
    assert_difference "User.count", -1 do
      delete :destroy, id: user.id
    end
    assert_redirected_to admin_users_path
  end
end
