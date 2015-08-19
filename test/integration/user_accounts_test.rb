require 'test_helper'

class UserAccountsTest < ActionDispatch::IntegrationTest

  test "signing up" do
    Capybara.reset_sessions!
    Capybara.current_driver = :poltergeist
    visit("/")
    click_link("Sign Up")
    fill_in("Email", :with => "dummied@gmail.com")
    fill_in("Username", :with => "cvannoy2")
    fill_in("Password", :with => "srgerhteyjherh")
    fill_in("Password confirmation", :with => "srgerhteyjherh")
    click_on("Create a user")
    assert page.has_content?('Log Out')
  end

end
