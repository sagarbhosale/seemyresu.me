require 'test_helper'

class ResumeTemplatesControllerTest < ActionController::TestCase
  setup do
    @resume_template = resume_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resume_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resume_template" do
    assert_difference('ResumeTemplate.count') do
      post :create, resume_template: { name: @resume_template.name }
    end

    assert_redirected_to resume_template_path(assigns(:resume_template))
  end

  test "should show resume_template" do
    get :show, id: @resume_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resume_template
    assert_response :success
  end

  test "should update resume_template" do
    put :update, id: @resume_template, resume_template: { name: @resume_template.name }
    assert_redirected_to resume_template_path(assigns(:resume_template))
  end

  test "should destroy resume_template" do
    assert_difference('ResumeTemplate.count', -1) do
      delete :destroy, id: @resume_template
    end

    assert_redirected_to resume_templates_path
  end
end
