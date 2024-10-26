require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one) # 假设你有一个名为 :one 的 fixture
    @comment = comments(:one) # 假设你有一个名为 :one 的 fixture
  end

  test "should get index" do
    get blog_comments_url(@blog)
    assert_response :success
  end

  test "should get new" do
    get new_blog_comment_url(@blog)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post blog_comments_url(@blog), params: { comment: { content: 'New content' } }
    end

    assert_redirected_to blog_comment_url(@blog, Comment.last)
  end

  test "should show comment" do
    get blog_comment_url(@blog, @comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_comment_url(@blog, @comment)
    assert_response :success
  end

  test "should update comment" do
    patch blog_comment_url(@blog, @comment), params: { comment: { content: 'Updated content' } }
    assert_redirected_to blog_comment_url(@blog, @comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete blog_comment_url(@blog, @comment)
    end

    assert_redirected_to blog_comments_url(@blog)
  end
end