require 'test_helper'
class Admin::GroupsControllerTest < ActionController::TestCase
  def setup
    @user = users(:admin)
    sign_in @user
    @group = groups(:default)
  end

  def test_index
    get :index
    assert_response :success
    assert_template :index
  end

  def test_show
    group = groups(:default)
    get :show, id: group.id
    assert_response :success
    assert_template :show
    assert_equal group.id, assigns(:group).id
  end

  def test_show_failure
    get :show, id: 23
    assert_response :redirect
    assert_redirected_to admin_groups_path
  end

  def test_new
    get :new
    assert_response :success
    assert_template :new
    assert assigns(:group)
  end

  def test_edit
    group = groups(:default)
    get :edit, id: group.id
    assert_response :success
    assert_template :edit
  end

  def test_update
    group = groups(:default)
    put :update, id: group.id, group: {
      name: 'new-default-name'
    }
    assert_redirected_to admin_group_path(group.id)
    group.reload
    assert_equal 'new-default-name', group.name
  end

  def test_update_failure
    group = groups(:default)
    put :update, id: group.id, group: {
      name: ''
    }
    assert_response :success
    assert_template :edit
  end

  def test_create
    group = groups(:default)
    assert_difference "Group.count" do
      post :create, group: {
        name: "newdefaultname",
        location: "another location",
        unit: "painful"
      }
    end
    assert_redirected_to admin_groups_path
  end

  def test_create_failure
    assert_no_difference "Group.count" do
      post :create, group: {}
    end
    assert_response :success
    assert_template :new
  end

  def test_destroy
    group = groups(:default)
    assert_difference "Group.count", -1 do
       delete :destroy, id: groups(:default).id
    end
    assert_redirected_to admin_groups_path
  end
end
