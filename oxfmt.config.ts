import { defineConfig } from "oxfmt"

export const sharedIgnorePatterns = [
  "public",
  "app/javascript/types/serializers",
  "app/javascript/routes",
  "app/views/pwa",
  "config/locales/**/*.yml",
]

export const fmtOptions = {
  semi: false,
  printWidth: 80,
  sortPackageJson: false,
  ignorePatterns: sharedIgnorePatterns,
}

export default defineConfig(fmtOptions)
