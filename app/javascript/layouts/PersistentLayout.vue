<script setup lang="ts">
import { computed } from "vue"
import { useColorMode } from "@vueuse/core"

const colorMode = useColorMode()
const theme = computed(() => (colorMode.value === "dark" ? "dark" : "light"))
console.log({ theme })
</script>

<template>
  <slot />
</template>
