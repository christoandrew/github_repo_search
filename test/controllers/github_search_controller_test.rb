require 'test_helper'

class GithubSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get github_search_index_url
    assert_response :success
  end

  test "should get search" do
    get github_search_search_url
    assert_response :success
  end

end
