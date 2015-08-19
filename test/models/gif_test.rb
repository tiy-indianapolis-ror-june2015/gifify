require 'test_helper'

class GifTest < ActiveSupport::TestCase

  should belong_to(:user)
  should have_many(:taggings)
  should have_many(:tags)

  should_not allow_value("http://www.whatever.com/exciting.pdf").for(:image_url)

  setup do
    @gif = FactoryGirl.create(:gif)
  end

  test "tag names" do
    @gif.add_tags("chewie")
    @gif.add_tags("han solo")
    assert_equal ["han solo", "chewie"], @gif.tag_names
  end

  test "tagged_with" do
    gif1 = Gif.create!(image_url: "http://i.giphy.com/PhuYiKAMf8cla.gif")
    gif1.add_tags("force awakens")
    gif2 = Gif.create!(image_url: "http://i.giphy.com/l41lRGlCHAAoQxQJi.gif")
    gif2.add_tags("force awakens")
    @gif.add_tags("a new hope")
    assert_equal 2, Gif.tagged_with("force awakens").count
    assert_equal [gif1, gif2], Gif.tagged_with("force awakens")
  end

  test "add_tags method" do
    @gif.add_tags("a new hope")
    assert_equal ["a new hope"], @gif.tag_names
  end

  test "add_tags with comma separated string" do
    @gif.add_tags("a new hope, funny, bts")
    assert_equal ["funny", "bts", "a new hope"], @gif.tag_names
  end

  test "add_tags with an array of tag names" do
    @gif.add_tags("a new hope", "funny", "bts", "luke")
    assert_equal ["luke", "funny", "bts", "a new hope"], @gif.tag_names
  end

  test "add_tags with mixed arguments" do
    @gif.add_tags("a new hope", "r2d2, c3po", "falcon")
    assert_equal ["r2d2", "falcon", "c3po", "a new hope"], @gif.tag_names
  end

end
