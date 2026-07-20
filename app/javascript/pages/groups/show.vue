<script setup lang="ts">
import { Form, Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { GroupsShow } from "@/types/serializers"
import peopleRoutes from "@/routes/PeopleController"
import { groups, groupMemberships } from "@/routes"

const props = defineProps<GroupsShow>()
const { t } = useTranslation()

const addMemberRoute = groupMemberships.create(props.group.id)
</script>

<template>
  <div class="space-y-6">
    <div class="flex items-center justify-between">
      <h1>{{ group.name }}</h1>
      <Link class="link" :href="groups.edit(group.id).url">{{
        t("groups.actions.edit")
      }}</Link>
    </div>

    <div class="space-y-2">
      <h2>{{ t("groups.show.members") }}</h2>

      <ul class="space-y-1">
        <li
          v-for="membership in group.groupMemberships"
          :key="membership.id"
          class="flex items-center gap-4"
        >
          <Link
            class="link"
            :href="peopleRoutes.show(membership.person.id).url"
            >{{ membership.person.name }}</Link
          >
          <Link
            class="link"
            :href="
              groupMemberships.destroy({ groupId: group.id, id: membership.id })
                .url
            "
            method="delete"
            as="button"
            >{{ t("groups.show.remove_member") }}</Link
          >
        </li>
      </ul>

      <Form
        :action="addMemberRoute.url"
        :method="addMemberRoute.method"
        #default="{ processing }"
        class="flex items-center gap-2"
      >
        <select name="group_membership[person_id]" class="w-fit">
          <option
            v-for="person in availablePeople"
            :key="person.id"
            :value="person.id"
          >
            {{ person.name }}
          </option>
        </select>
        <button type="submit" :disabled="processing">
          {{ t("groups.show.add_member") }}
        </button>
      </Form>
    </div>
  </div>
</template>
