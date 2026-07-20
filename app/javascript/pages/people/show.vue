<script setup lang="ts">
import { Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { PeopleShow } from "@/types/serializers"
import { formatDate, formatDateTime } from "@/lib/dates"
import peopleRoutes from "@/routes/PeopleController"

const props = defineProps<PeopleShow>()
const { t } = useTranslation()
</script>

<template>
  <div class="space-y-6">
    <div class="flex items-center justify-between">
      <h1>{{ person.name }}</h1>
      <Link class="link" :href="peopleRoutes.edit(props.person.id).url">{{
        t("people.actions.edit")
      }}</Link>
    </div>

    <dl class="grid grid-cols-[max-content_1fr] gap-x-8 gap-y-2 text-sm">
      <dt class="text-gray-500">
        {{ t("activerecord.attributes.person.favorite") }}
      </dt>
      <dd>{{ person.favorite ? t("common.yes") : t("common.no") }}</dd>

      <template v-if="person.birthday || person.birthdayYear">
        <dt class="text-gray-500">
          {{ t("activerecord.attributes.person.birthday") }}
        </dt>
        <dd>
          <template v-if="person.birthday">{{
            formatDate(person.birthday)
          }}</template>
          <template v-else>{{ person.birthdayYear }}</template>
        </dd>
      </template>

      <template v-if="person.age != null">
        <dt class="text-gray-500">
          {{ t("activerecord.attributes.person.age") }}
        </dt>
        <dd>{{ person.age }}</dd>
      </template>
    </dl>

    <div class="space-y-2">
      <h2>{{ t("people.show.notes") }}</h2>

      <ul class="space-y-1">
        <li v-for="note in notes" :key="note.id">
          <div class="flex items-center gap-4">
            <div class="font-bold">{{ note.title }}</div>
            <div class="text-gray-500">
              {{ formatDateTime(note.createdAt) }}
            </div>
          </div>
          <p class="whitespace-pre">{{ note.body }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>
