require "test_helper"

class Public::DiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_diagnoses_new_url
    assert_response :success
  end

  test "should get index" do
    get public_diagnoses_index_url
    assert_response :success
  end
end
