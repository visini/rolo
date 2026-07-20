# frozen_string_literal: true

# Configuration only — SimpleCov.start runs in bin/rails (and test_helper.rb
# as a fallback for directly-invoked test runners).
SimpleCov.configure do
  enable_coverage :line
  enable_coverage :branch
  enable_coverage :method
  coverage :line, minimum: 0
  coverage :branch, minimum: 0
  coverage :method, minimum: 0

  skip "lib/tasks"

  group "Decorators", "app/decorators"
  group "Resources", "app/resources"
end
