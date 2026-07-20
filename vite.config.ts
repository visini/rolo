import { defineConfig, lazyPlugins } from "vite-plus"
import { coverageConfigDefaults } from "vite-plus"
import ruby from "vite-plugin-ruby"
import vue from "@vitejs/plugin-vue"
// import vueDevTools from "vite-plugin-vue-devtools"
import tailwindcss from "@tailwindcss/vite"
import { fileURLToPath, URL } from "node:url"
import { fmtOptions, sharedIgnorePatterns } from "./oxfmt.config"

export default defineConfig({
  cacheDir: fileURLToPath(new URL("./node_modules/.vite", import.meta.url)),
  staged: {
    "*.{ts,vue}": "vp check --fix",
  },
  lint: {
    jsPlugins: [{ name: "vite-plus", specifier: "vite-plus/oxlint-plugin" }],
    rules: { "vite-plus/prefer-vite-plus-imports": "error" },
    options: { typeAware: true, typeCheck: true },
    ignorePatterns: sharedIgnorePatterns,
  },
  fmt: fmtOptions,
  plugins: lazyPlugins(() => [
    ruby(),
    vue(),
    // vueDevTools({ appendTo: "inertia.ts" }),
    tailwindcss(),
  ]),
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./app/javascript", import.meta.url)),
    },
  },
  test: {
    globals: true,
    environment: "happy-dom", // Per-file override to jsdom -> env-check.test.ts (happy-dom is faster default)
    slowTestThreshold: 75, // Flags any test creeping toward a full component mount's cost
    setupFiles: [
      fileURLToPath(new URL("./app/javascript/test/setup.ts", import.meta.url)),
    ],
    coverage: {
      exclude: [
        ...coverageConfigDefaults.exclude,
        "components/ui/**",
        "types/serializers/**",
      ],
    },
  },
})
