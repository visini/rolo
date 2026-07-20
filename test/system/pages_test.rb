require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "home page" do
    visit root_url

    assert_selector "h1", text: "Home"
  end
end
