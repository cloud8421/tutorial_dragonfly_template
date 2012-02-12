Factory.define :user do |u|
	u.first_name 'John'
	u.last_name  'Doe'
	u.sequence(:email) { |n| "persion#{n}@example.com" } 
end