<script setup lang="ts">
import { useTranslation } from "i18next-vue"
import PersonForm from "@/components/PersonForm.vue"
import type { PeopleEdit } from "@/types/serializers"
import { people } from "@/routes"

const props = defineProps<PeopleEdit>()

const { t } = useTranslation()
const updateRoute = people.update(props.person.id)
const cancelRoute = people.show(props.person.id)
</script>

<template>
  <div class="space-y-6">
    <h1>{{ t("people.actions.edit") }}</h1>
    <PersonForm
      :action="updateRoute.url"
      :method="updateRoute.method"
      :person="props.person"
      :cancel-href="cancelRoute.url"
    />
  </div>
</template>
