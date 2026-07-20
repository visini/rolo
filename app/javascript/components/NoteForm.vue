<script setup lang="ts">
import { onMounted, useTemplateRef } from "vue"
import { Form, Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { Note } from "@/types/serializers"

const props = defineProps<{
  action: string
  method: "post" | "patch"
  note?: Pick<Note, "title" | "body">
  cancelHref?: string
}>()

const { t } = useTranslation()

const err = (e: string | string[] | undefined) =>
  e ? [e].flat().join(", ") : ""

// Set once on mount, not via a reactive `:value` binding — the latter
// gets re-patched (wiping whatever the user typed) whenever this
// scoped slot re-renders, e.g. when the form starts processing or a
// validation error comes back.
const titleInput = useTemplateRef("titleInput")
const bodyInput = useTemplateRef("bodyInput")
onMounted(() => {
  if (titleInput.value) titleInput.value.value = props.note?.title ?? ""
  if (bodyInput.value) bodyInput.value.value = props.note?.body ?? ""
})
</script>

<template>
  <Form :action="action" :method="method" #default="{ errors, processing }">
    <div class="space-y-4 max-w-sm">
      <div>
        <label for="note_title">{{
          t("activerecord.attributes.note.title")
        }}</label>
        <input
          ref="titleInput"
          id="note_title"
          name="note[title]"
          type="text"
        />
        <p v-if="errors.title" class="text-red-600 text-sm">
          {{ err(errors.title) }}
        </p>
      </div>

      <div>
        <label for="note_body">{{
          t("activerecord.attributes.note.body")
        }}</label>
        <textarea ref="bodyInput" id="note_body" name="note[body]"></textarea>
        <p v-if="errors.body" class="text-red-600 text-sm">
          {{ err(errors.body) }}
        </p>
      </div>

      <div class="flex items-center gap-4">
        <button type="submit" :disabled="processing">
          {{ t("common.actions.save") }}
        </button>
        <Link v-if="cancelHref" class="link" :href="cancelHref">{{
          t("common.actions.cancel")
        }}</Link>
      </div>
    </div>
  </Form>
</template>
