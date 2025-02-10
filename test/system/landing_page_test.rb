require "application_system_test_case"

class LandingPageTest < ApplicationSystemTestCase
  test "should render account sign up form when 'Create account' is clicked" do
    visit root_path
    assert_selector "h1", text: "Happening now"

    click_on "Create account"
    assert_selector "h1", text: "Create your account"
  end

  test "should present omniauth signup buttons for GitHub and Google" do
    visit root_path
  end
end
