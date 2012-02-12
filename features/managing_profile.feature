Feature: managing user profile
	As a user
	In order to manage my data
	I want to access my user profile page

	Background:
		Given a user exists with email "email@example.com"

	Scenario: viewing my profile
		Given I am on the home page
		When I follow "Profile" for "email@example.com"
		Then I should be on the profile page for "email@example.com"

	Scenario: editing my profile
		Given I am on the profile page for "email@example.com"
		When I follow "Edit"
		And I change my email with "new_email@example.com"
		And I click "Save"
		Then I should be on the profile page for "email@example.com"
		And I should see "User updated"