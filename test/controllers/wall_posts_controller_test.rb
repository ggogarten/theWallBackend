require 'test_helper'

class WallPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wall_post = wall_posts(:one)
  end

  test "should get index" do
    get wall_posts_url, as: :json
    assert_response :success
  end

  test "should create wall_post" do
    assert_difference('WallPost.count') do
      post wall_posts_url, params: { wall_post: { postMsg: @wall_post.postMsg } }, as: :json
    end

    assert_response 201
  end

  test "should show wall_post" do
    get wall_post_url(@wall_post), as: :json
    assert_response :success
  end

  test "should update wall_post" do
    patch wall_post_url(@wall_post), params: { wall_post: { postMsg: @wall_post.postMsg } }, as: :json
    assert_response 200
  end

  test "should destroy wall_post" do
    assert_difference('WallPost.count', -1) do
      delete wall_post_url(@wall_post), as: :json
    end

    assert_response 204
  end
end
