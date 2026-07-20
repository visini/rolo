# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  context "#home" do
    should "render the home page" do
      get root_url

      assert_inertia_component "pages/home"
    end
  end
end
