require 'test_helper'

class GifUploadTest < ActionDispatch::IntegrationTest

  test "photo upload" do
    Capybara.reset_sessions!
    Capybara.current_driver = :poltergeist
    visit("/")
    original_count = page.all(:css, "#gif_list img").count
    click_link("Sign Up")
    fill_in("Email", :with => "chris@chrisvannoy.com")
    fill_in("Username", :with => "cvannoy")
    fill_in("Password", :with => "srgerhteyjherh")
    fill_in("Password confirmation", :with => "srgerhteyjherh")
    click_on("Create a user")
    click_link("New Gif")
    attach_file("gif_file", "/Users/chrisvannoy/Downloads/giphy (8).gif")
    fill_in("Tags", :with => "homer, simpson, meme")
    click_on("Geronimo!")
    assert_equal original_count + 1, page.all(:css, "#gif_list img").count
    click_link("Log Out")
  end

end
