# frozen_string_literal: true

require "test_helper"
require "i18n/tasks"
require "inertia_i18n/health_checker"
require "inertia_i18n/file_converter"

class I18nTest < ActiveSupport::TestCase
  def setup
    @i18n = I18n::Tasks::BaseTask.new
  end

  # i18n-tasks: backend locale checks
  def test_no_missing_keys
    missing_keys = @i18n.missing_keys
    assert_empty missing_keys, "Missing #{missing_keys.leaves.count} i18n keys, run `i18n-tasks missing' to show them"
  end

  def test_no_unused_keys
    unused_keys = @i18n.unused_keys
    assert_empty unused_keys, "#{unused_keys.leaves.count} unused i18n keys, run `i18n-tasks unused' to show them"
  end

  def test_files_are_normalized
    non_normalized = @i18n.non_normalized_paths
    assert_empty non_normalized, "Run `i18n-tasks normalize' to fix:\n#{non_normalized.map { |p| "  #{p}" }.join("\n")}"
  end

  def test_no_inconsistent_interpolations
    inconsistent = @i18n.inconsistent_interpolations
    assert_empty inconsistent, "#{inconsistent.leaves.count} keys have inconsistent interpolations, run `i18n-tasks check-consistent-interpolations'"
  end

  # inertia_i18n: frontend locale checks
  def test_frontend_translations_are_healthy
    InertiaI18n::FileConverter.convert_all
    checker = InertiaI18n::HealthChecker.new.check!

    message = ["\nTranslation health check failed!"]
    checker.issues[:missing].each { |i| message << "  Missing: #{i[:key]}" }
    checker.issues[:unused].each { |i| message << "  Unused: #{i[:key]}" }
    checker.issues[:unsync].each { |i| message << "  Unsync: #{i[:key]} (#{i[:locale]})" }

    assert checker.healthy?, message.join("\n")
  end
end
