require File.dirname(__FILE__) + '/../spec_helper'

describe DaysController do
  describe "get show" do
    it "redirect if the artist can't be found" do
      get :show, id: "undefined"
      expect(response).to redirect_to days_path
    end
  end

  describe "new" do
      describe "GET index" do
        it "users can access" do
          get :index
          expect(response).to render_template :index
        end

        it "users can access" do
          get :show, id: day.id
          expect(response).to render_template :show
        end
      end
    end

    it "should have form with a submit button" do
      get :new
      response.body.should have_selector("input[type='submit']")
    end

    it "should display 'new' template" do
      get :new
      expect(response).to be_success
      expect(response).to render_template('new')
    end
  end

  describe "edit" do
    render_views
    before(:each) do
      @artist = FactoryGirl.create(:artist, :name => 'Test Artist3')
    end

    it "should display 'edit' template" do
      get :edit, :id => @artist.id
      expect(response).to render_template('edit')
    end

  end

  describe "create" do
    before { login_admin_user }

    it "should redirect to new on invalid record" do
      post :create
      expect(response).to render_template('new')
    end

    it "should redirect to edit on valid record" do
      post :create, :artist => {:name => "Test Artist 4"}
      expect(response).to redirect_to(edit_artist_path(assigns(:artist)))
    end

    it "should create record on valid record" do
      expect{
        post :create, :artist => {:name => "Test Artist 4"}
      }.to change(Artist, :count).by(1)
    end

    it "should not create record on valid record if admin user isn't logged in" do
      ApplicationController.any_instance.stub(:current_user) { nil }
      expect{
        post :create, :artist => {:name => "Test Artist"}
      }.to change(Artist, :count).by(0)
    end
  end

  describe "update" do
    before(:each) do
     @artist = FactoryGirl.create(:artist, :name => 'Test Artist 5')
     login_admin_user
    end

    it "should render update template valid record" do
      put :update, :artist => {:name => 'Test Artist2'}, :format => 'js', :id => @artist.id
      expect(response).to render_template :update
    end

    it "should change record on valid data" do
      put :update, :artist => {:name => 'Test Artist2'}, :format => 'js', :id => @artist
      @artist.reload
      @artist.name.should == 'Test Artist2'
    end

    it "should not change record on valid data if admin user isn't logged in" do
      ApplicationController.any_instance.stub(:current_user) { nil }
      put :update, :artist => {:name => 'Test Artist2'}, :format => 'js', :id => @artist
      @artist.reload
      @artist.name.should == 'Test Artist 5'
    end
  end
