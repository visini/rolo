<script setup lang="ts">
import { useTranslation } from "i18next-vue"
import type { PeopleShow } from "@/types/serializers"
import { formatDate } from "@/lib/dates"

defineProps<PeopleShow>()
const { t } = useTranslation()
</script>

<template>
  <div class="space-y-6">
    <h1>{{ person.name }}</h1>

    <dl class="grid grid-cols-[max-content_1fr] gap-x-8 gap-y-2 text-sm">
      <dt class="text-muted-foreground">
        {{ t("activerecord.attributes.person.favorite") }}
      </dt>
      <dd>{{ person.favorite ? t("common.yes") : t("common.no") }}</dd>

      <template v-if="person.age != null">
        <dt class="text-muted-foreground">
          {{ t("activerecord.attributes.person.age") }}
        </dt>
        <dd>
          {{ person.age }}
          <template v-if="person.birthday"
            >({{ formatDate(person.birthday) }})</template
          >
        </dd>
      </template>
    </dl>
  </div>
</template>
