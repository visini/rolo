require "test_helper"

# Distinct suite name so system-test results merge with (instead of clobber)
# the unit runs' resultsets, which also report as "Minitest".
SimpleCov.command_name "Minitest (system)" if ENV["COVERAGE"]

Capybara.register_driver :playwright do |app|
  Capybara::Playwright::Driver.new(app,
    browser_type: ENV["PLAYWRIGHT_BROWSER"]&.to_sym || :chromium,
    headless: true)
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :playwright
end
