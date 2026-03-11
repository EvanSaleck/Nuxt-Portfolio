<script setup lang="ts">
const { t } = useI18n()
// TODO : Add a filter to select only projects with a certain tag (e.g. "featured").
interface Project {
  title: string
  description: string
  stack: string[]
  icon?: string
  github?: string
  web?: string
}

const projects = computed<Project[]>(() => [
  {
    title: t('projects.apoc.title'),
    description: t('projects.apoc.description'),
    stack: ['HTML', 'SCSS', 'PHP/Symfony', 'JS', 'C'],
    icon: 'apoc.webp',
    github: 'https://github.com/EvanSaleck/APOC-AlHaIZ-Breizh'
  },
  {
    title: t('projects.klory.title'),
    description: t('projects.klory.description'),
    stack: ['React', 'Express', 'DrizzleORM', 'PostgreSQL', 'Docker', 'TypeScript', 'TailwindCSS'],
    github: 'https://github.com/EvanSaleck/Klory'
  },
  {
    title: t('projects.bot.title'),
    description: t('projects.bot.description'),
    stack: ['NodeJs', 'Javascript', 'Discord.js'],
    github: 'https://github.com/EvanSaleck/MiniBotito'
  },
  {
    title: t('projects.portfolio2.title'),
    description: t('projects.portfolio2.description'),
    stack: ['Nextjs', 'TypeScript', 'TailwindCSS'],
    github: 'https://github.com/EvanSaleck/portfolio_v2',
    web: 'https://portfoliov2-ruddy.vercel.app/'
  },
  {
    title: t('projects.docker.title'),
    description: t('projects.docker.description'),
    stack: ['Docker'],
    github: 'https://github.com/EvanSaleck/SAE-1.03'
  },
  {
    title: t('projects.cheval.title'),
    description: t('projects.cheval.description'),
    stack: ['Java', 'JavaFX', 'Maven'],
    icon: 'imgcheval.png',
    github: 'https://github.com/EvanSaleck/Sae201'
  }
])
</script>

<template>
  <UContainer
    id="projects"
    class="py-20"
  >
    <div class="mb-12">
      <h2 class="text-3xl font-bold text-primary mb-2">
        {{ t("projects.page_title") }}
      </h2>
      <p class="text-muted text-lg text-neutral">
        {{ t("projects.page_description") }}
      </p>
    </div>
    <div class=" grid grid-cols-1 md:grid-cols-3 gap-6">
      <UCard
        v-for="project in projects"
        :key="project.title"
        class="flex flex-col group transition-transform duration-300 hover:-translate-y-1 hover:shadow-lg h-fit"
      >
        <template #header>
          <div class="flex items-center gap-3">
            <img
              v-if="project.icon"
              :src="`/imgs/${project.icon}`"
              :alt="project.title"
              class="size-8 rounded shadow-sm object-cover"
            >
            <h3 class="text-xl font-bold text-primary">
              {{ project.title }}
            </h3>
          </div>
        </template>

        <div class="flex-1">
          <p class="text-muted mb-4">
            {{ project.description }}
          </p>

          <div class="flex flex-wrap gap-2">
            <UBadge
              v-for="tech in project.stack"
              :key="tech"
              color="primary"
              variant="subtle"
            >
              {{ tech }}
            </UBadge>
          </div>
        </div>

        <template #footer>
          <div class="flex gap-3">
            <UButton
              v-if="project.github"
              :to="project.github"
              target="_blank"
              icon="i-simple-icons-github"
              color="neutral"
              variant="outline"
            >
              {{ t("projects.view_code") }}
            </UButton>
            <UButton
              v-if="project.web"
              :to="project.web"
              target="_blank"
              icon="i-lucide-globe"
              color="neutral"
              variant="outline"
            >
              {{ t("projects.view_demo") }}
            </UButton>
          </div>
        </template>
      </UCard>
    </div>
  </UContainer>
</template>
