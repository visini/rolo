# Fixes shoulda-context + Rails 8 reporter rerun snippet

require "rails/test_unit/reporter"  # ensure the class is loaded

module RailsTestUnitReporterExecutableFix
  def format_rerun_snippet(result)
    location, line =
      if result.respond_to?(:source_location)
        result.source_location
      else
        result.method(result.name).source_location
      end

    # Prefer class attribute, fall back to instance reader or default command
    exe =
      if self.class.respond_to?(:executable)
        self.class.executable
      elsif respond_to?(:executable)
        executable
      else
        "bin/rails test"
      end

    "#{exe} #{relative_path_for(location)}:#{line}"
  end
end

Rails::TestUnitReporter.prepend(RailsTestUnitReporterExecutableFix)
