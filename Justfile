dev:
  bin/dev

test:
  bundle exec standardrb
  npm run check
  vp test run
  bin/rails test

ci: schema fixtures i18n
  bin/ci

coverage:
  rm -rf coverage/
  RAILS_ENV=test bin/rails db:test:prepare
  COVERAGE=1 RAILS_ENV=test bin/rails test:all || true
  open "coverage/index.html"

# Coverage overview (no args) or per-file lookup, e.g. `just simplecov app/models/user.rb`
simplecov FILE="":
  @if [ -z "{{FILE}}" ]; then script/simplecov_report; else bundle exec simplecov coverage --no-color {{FILE}} && script/simplecov_detail {{FILE}}; fi

frontend:
  npm run ci

schema:
  rails typelizer:generate

fixtures:
  RAILS_ENV=test bin/rails frontend:fixtures:export
  vp check --fix

live:
  script/live_server

live-backup:
  script/db_backup

live-restore FILE:
  script/db_restore {{FILE}}

live-backups:
  ls -lh backups/*.dump

i18n:
  bundle exec rake inertia_i18n:normalize
  bundle exec i18n-tasks normalize
  bundle exec rake inertia_i18n:convert
  bundle exec i18n-tasks health
  bundle exec rake inertia_i18n:health
