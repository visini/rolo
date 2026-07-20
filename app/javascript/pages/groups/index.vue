<script setup lang="ts">
import { Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { GroupsIndex } from "@/types/serializers"
import peopleRoutes from "@/routes/PeopleController"
import { groups as groupsRoutes } from "@/routes"

defineProps<GroupsIndex>()
const { t } = useTranslation()
</script>

<template>
  <div class="space-y-6">
    <div class="flex items-center justify-between">
      <h1>{{ t("groups.index.title") }}</h1>
      <Link class="link" :href="groupsRoutes.new().url">{{
        t("groups.actions.new")
      }}</Link>
    </div>

    <div v-for="group in groups" :key="group.id" class="space-y-1">
      <h2>
        <Link class="link" :href="groupsRoutes.show(group.id).url">{{
          group.name
        }}</Link>
      </h2>

      <ul class="space-y-1">
        <li v-for="membership in group.groupMemberships" :key="membership.id">
          <Link
            class="link"
            :href="peopleRoutes.show(membership.person.id).url"
            >{{ membership.person.name }}</Link
          >
        </li>
      </ul>
    </div>
  </div>
</template>
