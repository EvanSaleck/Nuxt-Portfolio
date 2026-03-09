<script setup lang="ts">
const { t } = useI18n()
const localePath = useLocalePath()

useSeoMeta({
  title: () => t('seo.title'),
  description: () => t('seo.description')
})

const skills = [
  { name: 'Nuxt', icon: 'i-simple-icons-nuxtdotjs' },
  { name: 'Vue', icon: 'i-simple-icons-vuedotjs' },
  { name: 'TypeScript', icon: 'i-simple-icons-typescript' },
  { name: 'Node.js', icon: 'i-simple-icons-nodedotjs' },
  { name: 'PHP', icon: 'i-simple-icons-php' },
  { name: 'Symfony', icon: 'i-simple-icons-symfony' },
  { name: 'Tailwind CSS', icon: 'i-simple-icons-tailwindcss' },
  { name: 'PostgreSQL', icon: 'i-simple-icons-postgresql' },
  { name: 'MySQL', icon: 'i-simple-icons-mysql' },
  { name: 'Git', icon: 'i-simple-icons-git' },
  { name: 'Docker', icon: 'i-simple-icons-docker' }
]
</script>

<template>
  <div>
    <UPageHero
      id="home"
      orientation="horizontal"
      :ui="{ container: 'py-24 sm:py-32' }"
    >
      <template #title>
        <span class="text-muted text-2xl font-medium block mb-2">{{ t('hero.greeting') }}</span>
        <span class="text-primary">{{ t('hero.name') }}</span>
        <br>
        <span>{{ t('hero.title') }}</span>
      </template>

      <template #description>
        {{ t('hero.subtitle') }}
      </template>

      <template #links>
        <UButton
          :to="localePath('/projects')"
          size="xl"
          trailing-icon="i-lucide-arrow-right"
        >
          {{ t('hero.cta_primary') }}
        </UButton>
        <UButton
          :to="localePath('/contact')"
          size="xl"
          color="neutral"
          variant="subtle"
          icon="i-lucide-mail"
        >
          {{ t('hero.cta_secondary') }}
        </UButton>
      </template>

      <template #default>
        <div class="flex items-center justify-center size-full">
          <div class="relative size-72">
            <div class="absolute inset-0 rounded-full bg-primary/10 animate-pulse" />
            <div class="absolute inset-4 rounded-full bg-primary/15 flex items-center justify-center">
              <UAvatar
                src="https://github.com/benjamincanac.png"
                size="3xl"
                loading="lazy"
              />
            </div>
          </div>
        </div>
      </template>
    </UPageHero>

    <!-- Skills Bar -->
    <div class="border-y border-default bg-muted/30 py-6">
      <div class="container mx-auto px-4">
        <div class="flex flex-wrap items-center justify-center gap-6">
          <div
            v-for="skill in skills"
            :key="skill.name"
            class="flex items-center gap-2 text-muted hover:text-default transition-colors"
          >
            <UIcon
              :name="skill.icon"
              class="size-5"
            />
            <span class="text-sm font-medium">{{ skill.name }}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Projects Section -->
    <ProjectsSection />

    <!-- About Section -->
    <AboutSection />

    <!-- Features / What I offer -->
    <UPageSection
      id="features"
      :title="t('about.skills_title')"
      :features="[{
        icon: 'i-lucide-layout',
        title: 'Front-End Development',
        description: 'Building modern, responsive UIs with Vue 3 & Nuxt 3, Tailwind CSS and a focus on performance and accessibility.'
      }, {
        icon: 'i-lucide-server',
        title: 'Back-End Development',
        description: 'Designing scalable REST APIs and server-side logic using Node.js, Express and PostgreSQL.'
      }, {
        icon: 'i-lucide-smartphone',
        title: 'Responsive Design',
        description: 'Creating pixel-perfect, mobile-first interfaces that look great on any device or screen size.'
      }, {
        icon: 'i-lucide-globe',
        title: 'Internationalisation',
        description: 'Implementing multilingual support with @nuxtjs/i18n so your app reaches a global audience.'
      }, {
        icon: 'i-lucide-zap',
        title: 'Performance Optimisation',
        description: 'SSR, SSG, lazy loading and code splitting to deliver fast load times and great Core Web Vitals.'
      }, {
        icon: 'i-lucide-git-branch',
        title: 'Clean Architecture',
        description: 'Writing maintainable, well-tested code following industry best practices and SOLID principles.'
      }]"
    />

    <!-- Skills Bar -->
    <div class="border-y border-default bg-muted/30 py-6">
      <div class="container mx-auto px-4">
        <div class="flex flex-wrap items-center justify-center gap-6">
          <div
            v-for="skill in skills"
            :key="skill.name"
            class="flex items-center gap-2 text-muted hover:text-default transition-colors"
          >
            <UIcon
              :name="skill.icon"
              class="size-5"
            />
            <span class="text-sm font-medium">{{ skill.name }}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- CTA -->
    <UPageSection>
      <UPageCTA
        :title="t('hero.cta_primary')"
        :description="t('hero.subtitle')"
        variant="subtle"
        :links="[{
          label: t('projects.page_title'),
          to: localePath('/projects'),
          trailingIcon: 'i-lucide-arrow-right',
          color: 'primary'
        }, {
          label: t('nav.contact'),
          to: localePath('/contact'),
          icon: 'i-lucide-mail',
          color: 'neutral',
          variant: 'outline'
        }]"
      />
    </UPageSection>
  </div>
</template>
