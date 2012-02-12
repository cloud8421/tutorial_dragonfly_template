Given /^a user exists with email "([^"]*)"$/ do |email|
	Factory(:user, :email => email)
end

Given /^I am on the home page$/ do
	visit '/'
end

When /^I click "([^"]*)"$/ do |name|
	click_button name
end

When /^I follow "([^"]*)"$/ do |name|
	click_link name
end

When /^I follow "([^"]*)" for "([^"]*)"$/ do |link_name, email|
	page.find('tr', :text => email).click_link(link_name)
end

Then /^I should be on (.+)$/ do |page|
	current_path = URI.parse(current_url).path
	current_path.should == path_to(page)
end

Given /^I am on the profile page for "([^"]*)"$/ do |email|
	visit user_path(User.find_by_email(email))
end

When /^I change my email with "([^"]*)"$/ do |email|
	fill_in :email, :with => email
end

Then /^I should see "([^"]*)"$/ do |content|
	page.should have_content(content)
end