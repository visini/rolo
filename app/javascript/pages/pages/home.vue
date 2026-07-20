<script setup lang="ts">
import { useTranslation } from "i18next-vue"
import type { PagesHome } from "@/types/serializers"

const props = defineProps<PagesHome>()
const { t } = useTranslation()
</script>

<template>
  <div class="space-y-6">
    <h1 data-testid="page-title">{{ t("navigation.home") }}</h1>

    <div>{{ t("common.hello") }}</div>
  </div>
</template>
