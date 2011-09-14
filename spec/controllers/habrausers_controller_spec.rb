require 'spec_helper'

describe HabrausersController do
  before(:each) do
    @user = Factory(:user)
    sign_in @user
  end

  def valid_attributes
    Factory.attributes_for(:habrauser, user: @user)
  end

  describe "GET index" do
    it "assigns all habrausers as @habrausers" do
      habrauser = Factory(:habrauser, user: @user)
      get :index
      assigns(:habrausers).should eq([habrauser])
    end

    it "should list habrausers only for current user" do
      habrausers = FactoryGirl.create_list(:habrauser, 2)
      get :index
      assigns(:habrausers).should_not include(*habrausers)
    end
  end

  describe "GET show" do
    before(:each) do
      @habrausers = FactoryGirl.create_list(:habrauser, 3, user: @user)
      @habrauser = @habrausers.first
    end

    it "assigns the requested habrauser as @habrauser" do
      get :show, id: @habrauser.id.to_s
      assigns(:habrauser).should eq(@habrauser)
    end

    it "should redirect to profile if the requested habrauser belong to not current user" do
      habrauser = Factory(:habrauser)
      get :show, id: habrauser.id.to_s
      response.should redirect_to(@user)
    end

    it "should redirect to profile if desired habrauser isn't exists" do
      get :show, id: 1200
      response.should redirect_to(@user)
    end
  end

  describe "GET new" do
    it "assigns a new habrauser as @habrauser" do
      get :new
      assigns(:habrauser).should be_a_new(Habrauser)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new habrauser" do
        expect {
          post :create, habrauser: valid_attributes
        }.to change(Habrauser, :count).by(1)
      end

      it "newly created habrauser should belong to current user" do
        post :create, habrauser: valid_attributes
        assigns(:habrauser).user.should == @user
      end

      it "assigns a newly created habrauser as @habrauser" do
        post :create, habrauser: valid_attributes
        assigns(:habrauser).should be_a(Habrauser)
        assigns(:habrauser).should be_persisted
      end

      it "should redirect to the current user's profile" do
        post :create, habrauser: valid_attributes
        response.should redirect_to(@user)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved habrauser as @habrauser" do
        Habrauser.any_instance.stub(:save).and_return(false)
        habrauser = Factory.build(:habrauser, user: @user)
        post :create, habrauser: habrauser.attributes
        assigns(:habrauser).attributes.should eq(habrauser.attributes)
      end

      it "re-renders the 'new' template" do
        Habrauser.any_instance.stub(:save).and_return(false)
        post :create, habrauser: valid_attributes
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested habrauser" do
      habrauser = Factory(:habrauser)
      expect {
        delete :destroy, id: habrauser.id.to_s
      }.to change(Habrauser, :count).by(-1)
    end

    it "redirects to current user's profile" do
      habrauser = Factory(:habrauser)
      delete :destroy, id: habrauser.id.to_s
      response.should redirect_to(@user)
    end
  end

end