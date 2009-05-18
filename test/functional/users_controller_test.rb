require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase

  should_route :get, "/users/1/edit",
    :controller => 'users', :action => 'edit', :id => '1'

  context "on GET to #edit when signed out" do
    setup { get :edit, :id => 1 }
    should_deny_access
  end

  context 'on GET to :edit when signed in' do
    setup do
      sign_in
      @user = Factory(:user)
      get :edit, :id => @user.to_param
    end

    should_assign_to       :user
    should_render_template :edit
    should_respond_with    :success

    should "have edit user form" do
      assert_select "form[id=edit_user_#{@user.to_param}]" do
        should_have_user_form_fields
        assert_select 'input[type=submit][id=user_submit]'
      end
    end
  end

  should_route :put, "/users/1",
    :controller => 'users', :action => 'update', :id => '1'

  context "on PUT to #update when signed out" do
    setup { put :update, :id => 1 }
    should_deny_access
  end

  context 'a PUT to :update when signed in' do
    setup do
      @user = Factory(:user)
      sign_in_as(@user)
      put :update, :id   => @user.to_param,
                   :user => { :email => "new@example.com" }
    end

    should 'update user email' do
      assert_not_equal @user.email, User.find_by_id(@user.id).email
    end

    should_redirect_to("home page") { root_path }
  end

  context 'A PUT to :update with bad parameters when signed in' do
    setup do
      @user = Factory(:user)
      sign_in_as(@user)
      put :update, :id => @user.to_param, :user => { :email => '' }
    end

    should 'not update user email' do
      assert_equal @user.email, User.find_by_id(@user.id).email
    end

    should_assign_to       :user
    should_render_template :edit
    should_respond_with    :success

    should 'have update user form' do
      assert_select "form[id=edit_user_#{@user.to_param}]" do
        should_have_user_form_fields
        assert_select 'input[type=submit][id=user_submit]'
      end
    end
  end

  protected

  def should_have_user_form_fields()
    assert_select 'input[id=user_email][type=text]'
  end

end