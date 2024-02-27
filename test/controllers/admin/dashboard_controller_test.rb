require 'test_helper'

module Admin
  class DashboardControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      @user = User.new(email: 'example@example.com', password: 'password', admin: true)
      sign_in @user
    end

    

    test 'index action should redirect non-admins to root_path' do
      @user.update(admin: false)
      sign_in @user
      get :index
      assert_redirected_to root_path
    end



    
  end
end