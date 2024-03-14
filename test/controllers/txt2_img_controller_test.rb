require "test_helper"

class Txt2ImgControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get txt2_img_index_url
    assert_response :success
  end
end
