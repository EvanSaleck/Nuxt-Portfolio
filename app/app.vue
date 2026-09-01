<script setup lang="ts">
import type { NavigationMenuItem } from '@nuxt/ui'

const isMenuOpen = ref(false)


const { t, locale } = useI18n()

useHead({
  meta: [
    { name: 'viewport', content: 'width=device-width, initial-scale=1' }
  ],
  link: [
    { rel: 'icon', href: '/favicon.ico' }
  ],
  htmlAttrs: {
    lang: locale
  }
})

useSeoMeta({
  title: () => t('seo.title'),
  description: () => t('seo.description'),
  ogTitle: () => t('seo.title'),
  ogDescription: () => t('seo.description'),
  twitterCard: 'summary_large_image'
})

const navLinks = computed<NavigationMenuItem[]>(() => [
  {
    label: t('nav.home'),
    to: localePath({ name: 'index', hash: '#home' }),
    exactHash: true
  },
  {
    label: t('nav.about'),
    to: localePath({ name: 'index', hash: '#about' }),
    exactHash: true
  },
  {
    label: t('nav.projects'),
    to: localePath({ name: 'index', hash: '#projects' }),
    exactHash: true
  },
  {
    label: t('nav.experience'),
    to: localePath({ name: 'index', hash: '#experience' }),
    exactHash: true
  }


])

const localePath = useLocalePath()
</script>

<template>
  <UApp>
    <UHeader title="Evan Saleck">
      <template #left>
        <NuxtLink :to="localePath('/')" class="flex items-center gap-2 font-bold text-lg">
          <UIcon name="i-lucide-code-2" class="text-primary size-5" />
          <span>Evan Saleck</span>
        </NuxtLink>
      </template>

      <UNavigationMenu :items="navLinks" class="hidden lg:flex" />

      <template #right>
        <LanguageSwitcher />
        <UColorModeButton />
      </template>

      <template #body>
        <div class="p-4">
          <UNavigationMenu :items="navLinks" orientation="vertical" />
        </div>
      </template>
    </UHeader>

    <UMain>
      <NuxtPage />
    </UMain>
  </UApp>
</template>
