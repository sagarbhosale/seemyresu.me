require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase

   test "missing what" do
   	feedback = Feedback.new
   	feedback.who = "someone"
   	assert !feedback.save
   end

   test "missing who" do
   	feedback = Feedback.new
   	feedback.description = "something"
   	assert !feedback.save
   end

   test "invalid email" do
   	feedback = Feedback.new
   	feedback.who = "invalidemail"
   	assert !feedback.save
   end

   test "valid data" do
   	feedback = Feedback.new
   	feedback.who = "test@example.com"
   	feedback.description = "test at example dot com"
   	assert feedback.save
   end

end
