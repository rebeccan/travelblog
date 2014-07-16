require 'test_helper'

class GalleryTest < ActiveSupport::TestCase
  test "adding a photo to a gallery" do
    gallery = Gallery.new
    gallery.name = "Hallo Welt"

    pic1 = Photo.new
    pic1.url = "http://www.example.com"
    pic1.post_main = true
    pic1.travel_main = false

    gallery.photos << pic1

    assert_equal 1, gallery.photos.size
  end

  test "getting a photo from gallery" do
  	gallery = Gallery.find(1) 

  	assert_equal "Australien 2014", gallery.name
  end
end
