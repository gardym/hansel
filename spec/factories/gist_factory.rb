require 'factory_girl'

FactoryGirl.define do

	factory :gist do
		sequence(:title) { |n| "#{n}_I'm sorry that good-looking people like us made you throw up and feel bad about yourself." }
		link				"http://www.hansel.com/"
		text				"http://www.hansel.com"
		done				false
		created_at	Time.now

		factory :text_gist do
			link 	nil
		end

		factory :done_gist do
			done 	true
		end 

	end

end
