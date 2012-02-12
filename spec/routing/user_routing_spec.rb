require 'spec_helper'

describe 'User routing' do
  
	it "should route to user show" do
	  { get: "/users/1" }.should route_to(
	  	controller: "users",
	  	action: "show",
	  	id: "1"
	  )
	end

	it "should route to user edit" do
	  { get: '/users/1/edit' }.should route_to(
	  	controller: "users",
	  	action: "edit",
	  	id: "1"
	  )
	end

	it "should route to user update" do
	  { put: '/users/1' }.should route_to(
	  	controller: "users",
	  	action: "update",
	  	id: "1"
	  )
	end

end