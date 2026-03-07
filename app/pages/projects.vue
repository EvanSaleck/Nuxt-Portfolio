<script setup lang="ts">
const { t, tm, rt } = useI18n()

useSeoMeta({
  title: () => t('seo.projects_title'),
  description: () => t('projects.page_description')
})

const projects = computed(() => {
  const items = tm('projects.items') as Array<Record<string, unknown>>
  return items.map(item => ({
    title: rt(item.title as string),
    description: rt(item.description as string),
    tags: (item.tags as unknown[]).map(tag => rt(tag as string)),
    demo: rt(item.demo as string),
    repo: rt(item.repo as string)
  }))
})

const allTags = computed(() => {
  const tags = new Set<string>()
  projects.value.forEach(p => p.tags.forEach(tag => tags.add(tag)))
  return Array.from(tags)
})

const selectedTag = ref<string | null>(null)

const filteredProjects = computed(() => {
  if (!selectedTag.value) return projects.value
  return projects.value.filter(p => p.tags.includes(selectedTag.value!))
})
</script>

<template>
  <div>
    <UPageHero
      :title="t('projects.page_title')"
      :description="t('projects.page_description')"
      :ui="{ container: 'py-16 sm:py-20' }"
    />

    <UContainer class="py-12">
      <!-- Tag Filter -->
      <div class="flex flex-wrap gap-2 mb-10">
        <UButton
          size="sm"
          :variant="selectedTag === null ? 'solid' : 'subtle'"
          :color="selectedTag === null ? 'primary' : 'neutral'"
          @click="selectedTag = null"
        >
          {{ t('projects.all') }}
        </UButton>
        <UButton
          v-for="tag in allTags"
          :key="tag"
          size="sm"
          :variant="selectedTag === tag ? 'solid' : 'subtle'"
          :color="selectedTag === tag ? 'primary' : 'neutral'"
          @click="selectedTag = tag"
        >
          {{ tag }}
        </UButton>
      </div>

      <!-- Projects Grid -->
      <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <UCard
          v-for="project in filteredProjects"
          :key="project.title"
          class="flex flex-col group hover:border-primary/50 transition-colors"
        >
          <template #header>
            <div class="flex items-center justify-between">
              <div class="size-10 rounded-lg bg-primary/10 flex items-center justify-center">
                <UIcon name="i-lucide-folder-open" class="size-5 text-primary" />
              </div>
              <div class="flex gap-2">
                <UButton
                  v-if="project.demo && project.demo !== '#'"
                  :to="project.demo"
                  target="_blank"
                  size="xs"
                  icon="i-lucide-external-link"
                  variant="ghost"
                  color="neutral"
                  :aria-label="t('projects.view_demo')"
                />
                <UButton
                  v-if="project.repo && project.repo !== '#'"
                  :to="project.repo"
                  target="_blank"
                  size="xs"
                  icon="i-simple-icons-github"
                  variant="ghost"
                  color="neutral"
                  :aria-label="t('projects.view_code')"
                />
              </div>
            </div>
          </template>

          <h3 class="font-semibold text-lg mb-2">
            {{ project.title }}
          </h3>
          <p class="text-muted text-sm flex-1">
            {{ project.description }}
          </p>

          <template #footer>
            <div class="flex flex-wrap gap-1.5">
              <UBadge
                v-for="tag in project.tags"
                :key="tag"
                variant="subtle"
                size="sm"
              >
                {{ tag }}
              </UBadge>
            </div>
          </template>
        </UCard>
      </div>
    </UContainer>
  </div>
</template>
