ENV["RAILS_ENV"] ||= "test"

# Coverage normally starts in bin/rails (before rake tasks and app code load);
# this is a fallback for runners that load test files directly. Config is
# shared via .simplecov.
if ENV["COVERAGE"] && !defined?(SimpleCov)
  require "simplecov"
  SimpleCov.start "rails"
end

require_relative "../config/environment"
require "rails/test_help"
require "minitest/mock"
require "webmock/minitest"
require "inertia_rails/minitest"
require_relative "support/rails_test_unit_reporter_fix"

# Build assets before running tests (because autoBuild: false by default)
ViteRuby.commands.build unless ViteRuby.config.auto_build

WebMock.disable_net_connect!(allow_localhost: true)

OakenTestSetup = Oaken.loader.test_setup

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)

    if ENV["COVERAGE"]
      # SimpleCov's own at_exit hook defers to Minitest.after_run, which only
      # fires in the parent process, not inside Rails' forked test workers.
      # Without this, each worker's coverage data is silently discarded.
      parallelize_teardown do |_worker|
        SimpleCov.result
      end
    end

    include OakenTestSetup
  end
end
