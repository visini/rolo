<script setup lang="ts">
import { Form, Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { Group } from "@/types/serializers"

const props = defineProps<{
  action: string
  method: "post" | "patch"
  group?: Pick<Group, "name">
  cancelHref: string
}>()

const { t } = useTranslation()

const err = (e: string | string[] | undefined) =>
  e ? [e].flat().join(", ") : ""
</script>

<template>
  <Form :action="action" :method="method" #default="{ errors, processing }">
    <div class="space-y-4 max-w-sm">
      <div>
        <label for="group_name">{{
          t("activerecord.attributes.group.name")
        }}</label>
        <input
          id="group_name"
          name="group[name]"
          type="text"
          :value="props.group?.name"
        />
        <p v-if="errors.name" class="text-red-600 text-sm">
          {{ err(errors.name) }}
        </p>
      </div>

      <div class="flex items-center gap-4">
        <button type="submit" :disabled="processing">
          {{ t("common.actions.save") }}
        </button>
        <Link class="link" :href="cancelHref">{{
          t("common.actions.cancel")
        }}</Link>
      </div>
    </div>
  </Form>
</template>
