<script setup lang="ts">
const { locale, locales, setLocale } = useI18n()

const availableLocales = computed(() =>
  locales.value.map(l => ({
    label: l.name,
    value: l.code,
    onSelect: () => setLocale(l.code as 'en' | 'fr')
  }))
)

const currentLocale = computed(() =>
  locales.value.find(l => l.code === locale.value)
)
</script>

<template>
  <UDropdownMenu
    :items="availableLocales"
    :content="{ align: 'end' }"
  >
    <UButton
      variant="ghost"
      color="neutral"
      icon="i-lucide-globe"
      :label="currentLocale?.code?.toUpperCase()"
      trailing-icon="i-lucide-chevron-down"
      size="sm"
      :aria-label="`Language: ${currentLocale?.name}`"
    />
  </UDropdownMenu>
</template>
