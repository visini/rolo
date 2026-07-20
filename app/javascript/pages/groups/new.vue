<script setup lang="ts">
import { useTranslation } from "i18next-vue"
import GroupForm from "@/components/GroupForm.vue"
import type { GroupsNew } from "@/types/serializers"
import { groups } from "@/routes"

const props = defineProps<GroupsNew>()

const { t } = useTranslation()
const createRoute = groups.create()
const cancelRoute = groups.index()
</script>

<template>
  <div class="space-y-6">
    <h1>{{ t("groups.actions.new") }}</h1>
    <GroupForm
      :action="createRoute.url"
      :method="createRoute.method"
      :group="props.group"
      :cancel-href="cancelRoute.url"
    />
  </div>
</template>
