# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  context "associations" do
  end

  context "validations" do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:email_address)
    should validate_uniqueness_of(:email_address).ignoring_case_sensitivity
  end
end
