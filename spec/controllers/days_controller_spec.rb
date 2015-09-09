# require File.dirname(__FILE__) + '/../spec_helper'
#
# describe DaysController do
#   describe "get show" do
#     it "redirect if the day can't be found" do
#       get :show, id: "undefined"
#       expect(response).to redirect_to days_path
#     end
#   end
#
#   describe "new" do
#       describe "GET index" do
#         it "users can access" do
#           get :index
#           expect(response).to render_template :index
#         end
#
#         it "users can access" do
#           get :show, id: day.id
#           expect(response).to render_template :show
#         end
#       end
#     end
#
#     it "should have form with a submit button" do
#       get :new
#       response.body.should have_selector("input[type='submit']")
#     end
#
#     it "should display 'new' template" do
#       get :new
#       expect(response).to be_success
#       expect(response).to render_template('new')
#     end
#   end
#
#   describe "edit" do
#     render_views
#     before(:each) do
#       @day = FactoryGirl.create(:day, :description => "Code Builders is awesome!", :link_to => )
#     end
#
#     it "should display 'edit' template" do
#       get :edit, :id => @day.id
#       expect(response).to render_template('edit')
#     end
#
#   end
#
#   describe "create" do
#
#     it "should redirect to new on invalid record" do
#       post :create
#       expect(response).to render_template('new')
#     end
#
#     it "should redirect to edit on valid record" do
#       post :create, :day => {:description => "Test Artist 4"}
#       expect(response).to redirect_to(edit_day_path(assigns(:day)))
#     end
#
#     it "should create record on valid record" do
#       expect{
#         post :create, :day => {:description => "Test Artist 4"}
#       }.to change(Artist, :count).by(1)
#     end
#
#     it "should not create record on valid record if admin user isn't logged in" do
#       ApplicationController.any_instance.stub(:current_user) { nil }
#       expect{
#         post :create, :day => {:description => "Test Artist"}
#       }.to change(Artist, :count).by(0)
#     end
#   end
#
#   describe "update" do
#     before(:each) do
#      @day = FactoryGirl.create(:day, :description => 'Test Artist 5')
#      login_admin_user
#     end
#
#     it "should render update template valid record" do
#       put :update, :day => {:description => 'Test Artist2'}, :format => 'js', :id => @day.id
#       expect(response).to render_template :update
#     end
#
#     it "should change record on valid data" do
#       put :update, :day => {:description => 'Test Artist2'}, :format => 'js', :id => @day
#       @day.reload
#       @day.description.should == 'Test Artist2'
#     end
#
#     it "should not change record on valid data if admin user isn't logged in" do
#       ApplicationController.any_instance.stub(:current_user) { nil }
#       put :update, :day => {:description => 'Test Artist2'}, :format => 'js', :id => @day
#       @day.reload
#       @day.name.should == 'Test Artist 5'
#     end
#   end
