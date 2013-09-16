require 'test_helper'

class FaqTest < ActiveSupport::TestCase

   test "missing answer" do
   	faq = Faq.new
   	faq.question = "what"
   	assert !faq.save
   end

   test "missing question" do
   	faq = Faq.new
   	faq.answer = "that"
   	assert !faq.save
   end

   test "valid data" do
   	faq = Faq.new
   	faq.question = "sup?"
   	faq.answer = "nothing much"
   	assert faq.save
   end

end
