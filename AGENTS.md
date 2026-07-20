# Repository guide

Ruby 4 and Rails 8.1 app with an Inertia/Vue 3 TypeScript frontend and PostgreSQL.

- Backend: `app/`, tests: `test/`
- Frontend: `app/javascript/`, tests: `app/javascript/test/`
- Run all tests with `just test`
  - Run backend tests only with `rails test`
  - Run frontend tests only with `npm run test`

Do not edit generated files:

- `app/javascript/locales/*.json`: edit `config/locales/{frontend,shared}/*.yml`, then run `just i18n`.
- `app/javascript/{types/serializers,routes}/`: edit Alba resources or Rails routes, then run `just schema`.
- `app/javascript/test/fixtures/`: edit `db/seeds/` or resources, then run `just fixtures`.

## Conventions

- Frontend: Vue 3 + Tailwind 4 with components in `app/javascript/components/` and pages in `app/javascript/pages/`. Lint and typecheck with `npm run check`.
