<script setup lang="ts">
import { Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { GroupsIndex } from "@/types/serializers"
import peopleRoutes from "@/routes/PeopleController"

defineProps<GroupsIndex>()
const { t } = useTranslation()
</script>

<template>
  <div class="space-y-6">
    <h1>{{ t("groups.index.title") }}</h1>

    <div v-for="group in groups" :key="group.id" class="space-y-1">
      <h2>{{ group.name }}</h2>

      <ul class="space-y-1">
        <li v-for="person in group.people" :key="person.id">
          <Link class="link" :href="peopleRoutes.show(person.id).url">{{
            person.name
          }}</Link>
        </li>
      </ul>
    </div>
  </div>
</template>
