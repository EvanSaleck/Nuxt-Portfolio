<script setup lang="ts">
import type { NavigationMenuItem } from '@nuxt/ui'

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
    label: t('nav.contact'),
    to: localePath({ name: 'index', hash: '#contact' }),
    exactHash: true
  }
])

const localePath = useLocalePath()
</script>

<template>
  <UApp>
    <UHeader :links="navLinks">
      <template #left>
        <NuxtLink
          :to="localePath('/')"
          class="flex items-center gap-2 font-bold text-lg"
        >
          <UIcon
            name="i-lucide-code-2"
            class="text-primary size-5"
          />
          <span>Evan Saleck</span>
        </NuxtLink>
      </template>

      <UNavigationMenu :items="navLinks" />

      <template #right>
        <LanguageSwitcher />
        <UColorModeButton />
        <UButton
          to="https://github.com/EvanSaleck"
          target="_blank"
          icon="i-simple-icons-github"
          aria-label="GitHub"
          color="neutral"
          variant="ghost"
        />
      </template>
    </UHeader>

    <UMain>
      <NuxtPage />
    </UMain>

    <UFooter>
      <template #left>
        <p class="text-sm text-muted">
          {{ t('footer.built_with') }} • © {{ new Date().getFullYear() }} Evan Saleck. {{ t('footer.rights') }}
        </p>
      </template>

      <template #right>
        <UButton
          to="https://github.com/EvanSaleck"
          target="_blank"
          icon="i-simple-icons-github"
          aria-label="GitHub"
          color="neutral"
          variant="ghost"
        />
        <UButton
          to="https://linkedin.com"
          target="_blank"
          icon="i-simple-icons-linkedin"
          aria-label="LinkedIn"
          color="neutral"
          variant="ghost"
        />
      </template>
    </UFooter>
  </UApp>
</template>
