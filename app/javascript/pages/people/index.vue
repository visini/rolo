<script setup lang="ts">
import { Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { PeopleIndex } from "@/types/serializers"
import peopleRoutes from "@/routes/PeopleController"

defineProps<PeopleIndex>()
const { t } = useTranslation()
</script>

<template>
  <div class="space-y-6">
    <div class="flex items-center justify-between">
      <h1>{{ t("people.index.title") }}</h1>
      <Link class="link" :href="peopleRoutes.new().url">{{
        t("people.actions.new")
      }}</Link>
    </div>

    <ul class="space-y-1">
      <li v-for="person in people" :key="person.id">
        <Link class="link" :href="peopleRoutes.show(person.id).url">{{
          person.name
        }}</Link>
      </li>
    </ul>
  </div>
</template>
