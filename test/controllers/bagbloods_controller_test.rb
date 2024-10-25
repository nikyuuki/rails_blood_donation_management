require "test_helper"

class BagbloodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bagblood = bagbloods(:one)
  end

  test "should get index" do
    get bagbloods_url
    assert_response :success
  end

  test "should get new" do
    get new_bagblood_url
    assert_response :success
  end

  test "should create bagblood" do
    assert_difference("Bagblood.count") do
      post bagbloods_url, params: { bagblood: { donor_id: @bagblood.donor_id, volume: @bagblood.volume } }
    end

    assert_redirected_to bagblood_url(Bagblood.last)
  end

  test "should show bagblood" do
    get bagblood_url(@bagblood)
    assert_response :success
  end

  test "should get edit" do
    get edit_bagblood_url(@bagblood)
    assert_response :success
  end

  test "should update bagblood" do
    patch bagblood_url(@bagblood), params: { bagblood: { donor_id: @bagblood.donor_id, volume: @bagblood.volume } }
    assert_redirected_to bagblood_url(@bagblood)
  end

  test "should destroy bagblood" do
    assert_difference("Bagblood.count", -1) do
      delete bagblood_url(@bagblood)
    end

    assert_redirected_to bagbloods_url
  end
end
