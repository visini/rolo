<script setup lang="ts">
import { useTranslation } from "i18next-vue"
import PersonForm from "@/components/PersonForm.vue"
import type { PeopleNew } from "@/types/serializers"
import { people } from "@/routes"

const props = defineProps<PeopleNew>()

const { t } = useTranslation()
const createRoute = people.create()
const cancelRoute = people.index()
</script>

<template>
  <div class="space-y-6">
    <h1>{{ t("people.actions.new") }}</h1>
    <PersonForm
      :action="createRoute.url"
      :method="createRoute.method"
      :person="props.person"
      :cancel-href="cancelRoute.url"
    />
  </div>
</template>
