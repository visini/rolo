<script setup lang="ts">
import { Form, Link } from "@inertiajs/vue3"
import { useTranslation } from "i18next-vue"
import type { Person } from "@/types/serializers"

const props = defineProps<{
  action: string
  method: "post" | "patch"
  person?: Pick<
    Person,
    | "firstName"
    | "lastName"
    | "favorite"
    | "birthdayDay"
    | "birthdayMonth"
    | "birthdayYear"
  >
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
        <label for="person_first_name">{{
          t("activerecord.attributes.person.first_name")
        }}</label>
        <input
          id="person_first_name"
          name="person[first_name]"
          type="text"
          :value="props.person?.firstName"
        />
        <p v-if="errors.firstName" class="text-red-600 text-sm">
          {{ err(errors.firstName) }}
        </p>
      </div>

      <div>
        <label for="person_last_name">{{
          t("activerecord.attributes.person.last_name")
        }}</label>
        <input
          id="person_last_name"
          name="person[last_name]"
          type="text"
          :value="props.person?.lastName"
        />
        <p v-if="errors.lastName" class="text-red-600 text-sm">
          {{ err(errors.lastName) }}
        </p>
      </div>

      <div class="flex items-center gap-2">
        <input type="hidden" name="person[favorite]" value="0" />
        <input
          id="person_favorite"
          name="person[favorite]"
          type="checkbox"
          value="1"
          :checked="props.person?.favorite"
        />
        <label for="person_favorite">{{
          t("activerecord.attributes.person.favorite")
        }}</label>
      </div>

      <div>
        <label>{{ t("activerecord.attributes.person.birthday") }}</label>
        <div class="flex gap-2">
          <input
            aria-label="Day"
            name="person[birthday_day]"
            type="number"
            min="1"
            max="31"
            placeholder="DD"
            class="w-16"
            :value="props.person?.birthdayDay"
          />
          <input
            aria-label="Month"
            name="person[birthday_month]"
            type="number"
            min="1"
            max="12"
            placeholder="MM"
            class="w-16"
            :value="props.person?.birthdayMonth"
          />
          <input
            aria-label="Year"
            name="person[birthday_year]"
            type="number"
            placeholder="YYYY"
            class="w-20"
            :value="props.person?.birthdayYear"
          />
        </div>
        <p v-if="errors.birthdayDay" class="text-red-600 text-sm">
          {{ err(errors.birthdayDay) }}
        </p>
        <p v-if="errors.birthdayMonth" class="text-red-600 text-sm">
          {{ err(errors.birthdayMonth) }}
        </p>
        <p v-if="errors.birthdayYear" class="text-red-600 text-sm">
          {{ err(errors.birthdayYear) }}
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
