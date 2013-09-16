require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    @feedback = feedbacks(:one)
  end

  test "feedback submit" do
    assert_difference('Feedback.count') do
      post :create, {"feedback"=>{"who"=>"amar86@gmail.com", "description"=>"adsfsdfds sdf sfgsd ds"}}
    end
 
    assert_redirected_to "/"
  end

end
