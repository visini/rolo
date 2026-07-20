# frozen_string_literal: true

require "test_helper"
require_relative "../../../lib/frontend_fixtures/exporter"

class FrontendFixturesExporterTest < ActiveSupport::TestCase
  test "models returns the ApplicationRecord classes with a seed file" do
    models = FrontendFixtures::Exporter.new.send(:models)

    assert_equal [User], models.sort_by(&:name)
  end
end
