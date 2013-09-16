require 'test_helper'

class UserTest < ActiveSupport::TestCase

   test "invalid email format" do

   		["test@.com", "magone.co", "test", "random@.", "@afadf.dsfs", "@adffd."].each do |inv|
	   		user = User.new
	   		user.email = inv
	   		user.firstname = "test"
	   		user.password_hash = "something"
	   		assert !user.save
   		end

	end

   test "no duplicate email" do
   		user = User.new
   		user.email = "test@example.com"
   		user.firstname = "test"
   		user.password_hash = "something"
   		assert user.save

   		user1 = User.new
   		user1.email = "test@example.com"
   		user1.firstname = "test12"
   		user1.password_hash = "something12"
   		assert !user1.save
   end

   test "default values" do
   		user = User.new
   		user.email = "test@example.com"
   		user.firstname = "test"
   		user.password_hash = "something"
   		assert user.save

   		assert user.views = 0
   		assert user.resume_template = 1
   end

end