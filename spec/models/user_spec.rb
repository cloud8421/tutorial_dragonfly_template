require 'spec_helper'

describe User do

	context "validations" do
		
    let!(:user) {Factory(:user)}

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

	end

	context "attributes" do

		let(:user) { Factory(:user, :first_name => "John", :last_name => "Doe") }

		it "should have a name attribute" do
			user.should respond_to(:name)
		end

		it "should have the right name" do
			user.name.should eq('John Doe')
		end

	end  

end