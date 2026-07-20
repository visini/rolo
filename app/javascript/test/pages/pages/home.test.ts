import { render, screen } from "@testing-library/vue"
import I18NextVue from "i18next-vue"
import i18n from "@/i18n"
import usersFixture from "@/test/fixtures/users"

import PagesHomePage from "@/pages/pages/home.vue"
import type { PagesHome } from "@/types"
import { GlobalMountOptions } from "@vue/test-utils"

const global = {
  plugins: [[I18NextVue, { i18next: i18n }]],
} as GlobalMountOptions

describe("pages/home", () => {
  test("renders current user props", () => {
    const props = {
      currentUser: usersFixture.camillo,
    } satisfies PagesHome

    render(PagesHomePage, { props, global })

    expect(screen.getByTestId("page-title")).toHaveTextContent("Home")
  })
})
