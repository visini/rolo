<script setup lang="ts">
import { Link, usePage } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import { groups, home, people } from "@/routes"

const { t } = useTranslation()
const page = usePage()
const current = (name: string) => page.component === name
</script>

<template>
  <div class="min-h-screen bg-background text-foreground">
    <nav class="flex items-center justify-between border-b px-6 py-4">
      <div class="flex gap-6">
        <Link
          :href="home().url"
          class="font-semibold hover:underline"
          :class="{ underline: current('pages/home') }"
          >{{ t("navigation.home") }}</Link
        >
        <Link
          :href="people.index().url"
          class="font-semibold hover:underline"
          :class="{ underline: current('people/index') }"
          >{{ t("navigation.people") }}</Link
        >
        <Link
          :href="groups.index().url"
          class="font-semibold hover:underline"
          :class="{ underline: current('groups/index') }"
          >{{ t("navigation.groups") }}</Link
        >
      </div>
    </nav>
    <main class="p-6">
      <slot />
    </main>
  </div>
</template>
