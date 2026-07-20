import { createInertiaApp } from "@inertiajs/vue3"
import type { DefineComponent } from "vue"
import { createApp, h } from "vue"
import I18NextVue from "i18next-vue"

import i18n, { setI18nLocale } from "@/i18n"
import PersistentLayout from "@/layouts/PersistentLayout.vue"
import Default from "@/layouts/Default.vue"
import type { SharedProps } from "@/types"

const appName = import.meta.env.VITE_APP_NAME ?? "Rolo"

createInertiaApp<SharedProps>({
  title: (title) => (title ? `${title} - ${appName}` : appName),

  resolve: (name) => {
    const pages = import.meta.glob<DefineComponent>("../pages/**/*.vue", {
      eager: true,
    })
    const page = pages[`../pages/${name}.vue`]
    if (!page) {
      console.error(`Missing Inertia page component: '${name}.vue'`)
    }

    page.default.layout ??= [PersistentLayout, Default]

    return page
  },

  setup({ el, App, props, plugin }) {
    setI18nLocale(props.initialPage.props.locale)

    createApp({ render: () => h(App, props) })
      .use(plugin)
      .use(I18NextVue, { i18next: i18n })
      .mount(el!)
  },

  defaults: {
    visitOptions: () => ({ queryStringArrayFormat: "brackets" }),
  },
}).catch((error) => {
  if (document.getElementById("app")) {
    throw error
  } else {
    console.error(
      "Missing root element.\n\n" +
        "If you see this error, it probably means you loaded Inertia.js on non-Inertia pages.\n" +
        'Consider moving <%= vite_javascript_tag "inertia" %> to the Inertia-specific layout instead.',
    )
  }
})
