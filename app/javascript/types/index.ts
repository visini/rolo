import type { Locale } from "@/i18n"

export type FlashData = {
  notice?: string
  alert?: string
  success?: string
  error?: string
}

export type SharedProps = {
  locale: Locale
}

export type JSONObject = Record<string, unknown>

export * from "./serializers"
