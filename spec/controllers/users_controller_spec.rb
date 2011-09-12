require 'spec_helper'

describe UsersController do

  describe "GET show" do
    before(:each) do
      @user = Factory.create(:user)
      sign_in @user
    end

    it "assigns the requested user as @user" do
      get :show, id: @user.id.to_s
      assigns(:user).should eq(@user)
    end

    it "should redirect to current user if a desired user is not exist" do
      desired_user_id = User.maximum(:id) + 10
      get :show, id: desired_user_id.to_s
      response.should redirect_to(@user)
    end

    it "should redirect to current user if a desired user is not current user" do
      desired_user = Factory(:user)
      get :show, id: desired_user.id.to_s
      response.should redirect_to(@user)
    end

    it "assigns the requested user's habrausers as @habrausers" do
      habrausers = [1,2,3].map { |i| Factory(:habrauser, user: @user) }
      get :show, id: @user.id.to_s
      assigns(:habrausers).should eq(habrausers)
    end

    it "should redirect to current user if :id is invalid" do
      ids = ['qweaaasd', -1, :hbrhbr]
      ids.each do |id|
        get :show, id: id.to_s
        response.should redirect_to(@user)
      end
    end

    it "should redirect to sing_in action if user is not singed in" do
      sign_out @user
      get :show, id: @user.id.to_s
      response.should redirect_to(new_user_session_path)
    end
  end

end