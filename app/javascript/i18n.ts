import i18next from "i18next"
import en from "@/locales/en.json"

export const supportedLocales = ["en"] as const

export type Locale = (typeof supportedLocales)[number]

const defaultLocale: Locale = "en"

const isLocale = (locale: unknown): locale is Locale =>
  typeof locale === "string" && supportedLocales.includes(locale as Locale)

export const normalizeLocale = (locale: unknown): Locale =>
  isLocale(locale) ? locale : defaultLocale

void i18next.init({
  lng: defaultLocale,
  resources: {
    en: { translation: en },
  },
  fallbackLng: defaultLocale,
  interpolation: { escapeValue: false },
})

export const setI18nLocale = (locale: unknown) => {
  void i18next.changeLanguage(normalizeLocale(locale))
}

export default i18next
