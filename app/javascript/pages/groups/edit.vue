<script setup lang="ts">
import { useTranslation } from "i18next-vue"
import GroupForm from "@/components/GroupForm.vue"
import type { GroupsEdit } from "@/types/serializers"
import { groups } from "@/routes"

const props = defineProps<GroupsEdit>()

const { t } = useTranslation()
const updateRoute = groups.update(props.group.id)
const cancelRoute = groups.show(props.group.id)
</script>

<template>
  <div class="space-y-6">
    <h1>{{ t("groups.actions.edit") }}</h1>
    <GroupForm
      :action="updateRoute.url"
      :method="updateRoute.method"
      :group="props.group"
      :cancel-href="cancelRoute.url"
    />
  </div>
</template>
