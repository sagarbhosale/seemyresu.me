require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
fixtures :users
 
  test "login and logout" do

    ["/sharing", "/experiences", "/changepassword", "/schools", "/skills", "/achievements", "/template"].each do |cpg|

      get cpg
      assert_response :redirect

      post_via_redirect "/authenticate", {:user=>{:email=> users(:one).email, :password => "test"}}
      assert_response :success

      get cpg
      assert_response :success

      https!
      get "/logout"
      assert_response :redirect

      get cpg
      assert_response :redirect

    end
  end

  test "authorization good" do
  	get "/sharing"
  	assert_response :redirect

  	post_via_redirect "/authenticate", {:user=>{:email=> users(:one).email, :password => "test"}}
    assert_response :success

    get "/sharing"
  	assert_response :success
  end

  test "authorization bad" do
  	get "/sharing"
  	assert_response :redirect

  	post_via_redirect "/authenticate", {:user=>{:email=> users(:one).email, :password => "donttest"}}
	 assert_response :success

    get "/sharing"
    assert_response :redirect
  end

  test "open access to public pages" do
  	get "/feedback"
  	assert_response :success
  end

end
