require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test "get likes by post" do
    post = Post.find(1)
    assert post.likes.size == 2
  end
end
