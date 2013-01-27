FactoryGirl.define do 
	factory :user do
		name "factoryuser"
		password "password"
	end

	factory :admin do
		name "admin"
		password "admin"
		admin true
	end
end