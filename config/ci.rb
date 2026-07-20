# Run using bin/ci

require "active_support/continuous_integration"

CI = ActiveSupport::ContinuousIntegration

CI.run do
  step "Setup", "bin/setup --skip-server"

  step "Style: Ruby", "bundle exec standardrb"

  step "Check: Database consistency", "bundle exec database_consistency"

  step "Security: Gem audit", "bin/bundler-audit"
  step "Security: JS dependency audit", "npm audit"
  step "Security: Brakeman code analysis", "bin/brakeman --quiet --no-pager --exit-on-warn --exit-on-error"

  step "Check: Frontend", "npm run check"
  step "Tests: Frontend", "vp test run --coverage"

  # # See https://vite-ruby.netlify.app/guide/development.html#integration-tests-in-the-ci-✅
  # step "Precompile assets", "env RAILS_ENV=test VITE_SKIP_COMPRESSION=true bin/rails assets:precompile"
  step "Tests: Rails", "rm -rf coverage && env COVERAGE=1 RAILS_ENV=test bin/rails test"
  step "Tests: Seeds", "env RAILS_ENV=test bin/rails db:seed:replant"

  step "Tests: System", "env COVERAGE=1 RAILS_ENV=test bin/rails test:system"

  # Optional: set a green GitHub commit status to unblock PR merge.
  # Requires the `gh` CLI and `gh extension install basecamp/gh-signoff`.
  # if success?
  #   step "Signoff: All systems go. Ready for merge and deploy.", "gh signoff"
  # else
  #   failure "Signoff: CI failed. Do not merge or deploy.", "Fix the issues and try again."
  # end
end
