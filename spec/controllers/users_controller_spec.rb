require 'spec_helper'

describe UsersController do

  let!(:user) { Factory(:user) }

	describe "GET show" do

    context "with valid ID" do

      before do
        get :show, :id => user.id
      end

      it "should be success" do
        response.should be_success
      end

      it "should render the show page" do
        response.should render_template('show')
      end

    end

    context "with invalid ID" do

      before do
        get :show, :id => 999
      end

      it "should redirect to the root path" do
        response.should redirect_to(root_path)
      end

      it "should render the right flash" do
        flash[:error].should =~ /Invalid user id/
      end

    end

	end

  describe "GET edit" do

    context "with valid ID" do

      before do
        get :edit, :id => user.id
      end

      it "should be success" do
        response.should be_success
      end

      it "should render the edit page" do
        response.should render_template('edit')
      end

    end

    context "with invalid ID" do

      before do
        get :edit, :id => 999
      end

      it "should redirect to the root path" do
        response.should redirect_to(root_path)
      end

      it "should render the right flash" do
        flash[:error].should =~ /Invalid user id/
      end

    end

  end

  describe "PUT update" do

    context "with valid ID" do

      context "with invalid DATA" do

        before do
          put :update, :id => user.id, :user => { :email => '' }
        end

        it "should render the edit page" do
          response.should render_template("edit")
        end

        it "should have an error flash" do
          flash[:error].should =~ /Validation errors/
        end

      end

      context "with valid DATA" do

        before do
          put :update, :id => user.id, :user => { :email => 'brand_new_email@example.com' }
        end

        it "should render the show page" do
          response.should redirect_to(user_path(user))
        end

        it "should have an error flash" do
          flash[:success].should =~ /User updated/
        end

      end

    end

    context "with invalid ID" do

      before do
        put :update, :id => 999
      end

      it "should redirect to the root path" do
        response.should redirect_to(root_path)
      end

      it "should render the right flash" do
        flash[:error].should =~ /Invalid user id/
      end

    end

  end

end