require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "get photos by post" do
    post = Post.find(1)
    
    assert post.galleries.size == 1

    gallery = post.galleries[0]

    assert gallery.photos.size == 2
  end
end
