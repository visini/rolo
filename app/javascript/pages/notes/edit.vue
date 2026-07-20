<script setup lang="ts">
import { useTranslation } from "i18next-vue"
import NoteForm from "@/components/NoteForm.vue"
import type { NotesEdit } from "@/types/serializers"
import { notes, people } from "@/routes"

const props = defineProps<NotesEdit>()

const { t } = useTranslation()
const updateRoute = notes.update({
  personId: props.person.id,
  id: props.note.id,
})
const cancelRoute = people.show(props.person.id)
</script>

<template>
  <div class="space-y-6">
    <h1>{{ t("notes.actions.edit") }}</h1>
    <NoteForm
      :action="updateRoute.url"
      :method="updateRoute.method"
      :note="props.note"
      :cancel-href="cancelRoute.url"
    />
  </div>
</template>
