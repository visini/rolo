<script setup lang="ts">
import { Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { PagesHome } from "@/types/serializers"
import { formatDate } from "@/lib/dates"
import people from "@/routes/PeopleController"

const props = defineProps<PagesHome>()
const { t } = useTranslation()
</script>

<template>
  <div class="space-y-6">
    <h1 data-testid="page-title">{{ t("navigation.home") }}</h1>

    <div class="space-y-2">
      <h2>{{ t("pages.home.upcoming_birthdays") }}</h2>

      <ul class="space-y-1" v-if="props.upcomingBirthdays.length > 0">
        <li
          v-for="person in props.upcomingBirthdays"
          :key="person.id"
          class="flex items-center gap-2"
        >
          <Link class="link" :href="people.show(person.id).url">{{
            person.name
          }}</Link>
          <div v-if="person.birthday" class="text-gray-500">
            ({{ formatDate(person.birthday) }})
          </div>
        </li>
      </ul>
      <div v-else class="text-gray-500">{{ t("common.none") }}</div>
    </div>
  </div>
</template>
