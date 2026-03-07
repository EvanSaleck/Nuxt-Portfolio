<script setup lang="ts">
const { t, tm, rt } = useI18n()

useSeoMeta({
  title: () => t('seo.about_title'),
  description: () => t('about.page_description')
})

const skills = [
  { name: 'Vue 3', icon: 'i-simple-icons-vuedotjs', level: 95 },
  { name: 'Nuxt 3', icon: 'i-simple-icons-nuxtdotjs', level: 92 },
  { name: 'TypeScript', icon: 'i-simple-icons-typescript', level: 88 },
  { name: 'Tailwind CSS', icon: 'i-simple-icons-tailwindcss', level: 90 },
  { name: 'Node.js', icon: 'i-simple-icons-nodedotjs', level: 85 },
  { name: 'PostgreSQL', icon: 'i-simple-icons-postgresql', level: 80 },
  { name: 'Docker', icon: 'i-simple-icons-docker', level: 75 },
  { name: 'Git', icon: 'i-simple-icons-git', level: 92 }
]

const experience = computed(() => {
  const items = tm('about.experience') as Array<Record<string, unknown>>
  return items.map(item => ({
    role: rt(item.role as string),
    company: rt(item.company as string),
    period: rt(item.period as string),
    description: rt(item.description as string)
  }))
})
</script>

<template>
  <div>
    <UPageHero
      :title="t('about.page_title')"
      :description="t('about.page_description')"
      :ui="{ container: 'py-16 sm:py-20' }"
    />

    <UContainer class="py-12 space-y-20">
      <!-- Intro -->
      <div class="grid lg:grid-cols-2 gap-12 items-center">
        <div class="space-y-4">
          <h2 class="text-2xl font-bold">
            {{ t('about.intro_title') }}
          </h2>
          <p class="text-muted text-lg leading-relaxed">
            {{ t('about.intro_text') }}
          </p>
          <p class="text-muted leading-relaxed">
            {{ t('about.bio_text') }}
          </p>
          <UButton
            href="/cv.pdf"
            download
            icon="i-lucide-download"
            variant="subtle"
            class="mt-4"
          >
            {{ t('about.download_cv') }}
          </UButton>
        </div>

        <div class="flex justify-center">
          <div class="relative">
            <div class="size-64 rounded-2xl bg-primary/10 flex items-center justify-center">
              <UIcon name="i-lucide-user" class="size-32 text-primary/50" />
            </div>
            <div class="absolute -bottom-3 -right-3 bg-primary text-white rounded-xl px-4 py-2 text-sm font-semibold shadow-lg">
              7+ years exp
            </div>
          </div>
        </div>
      </div>

      <!-- Skills -->
      <div>
        <h2 class="text-2xl font-bold mb-8">
          {{ t('about.skills_title') }}
        </h2>
        <div class="grid sm:grid-cols-2 gap-6">
          <div
            v-for="skill in skills"
            :key="skill.name"
            class="space-y-2"
          >
            <div class="flex items-center justify-between">
              <div class="flex items-center gap-2">
                <UIcon :name="skill.icon" class="size-4 text-primary" />
                <span class="font-medium text-sm">{{ skill.name }}</span>
              </div>
              <span class="text-muted text-xs">{{ skill.level }}%</span>
            </div>
            <div class="h-2 bg-muted rounded-full overflow-hidden">
              <div
                class="h-full bg-primary rounded-full transition-all duration-700"
                :style="{ width: `${skill.level}%` }"
              />
            </div>
          </div>
        </div>
      </div>

      <!-- Experience -->
      <div>
        <h2 class="text-2xl font-bold mb-8">
          {{ t('about.experience_title') }}
        </h2>
        <div class="space-y-6">
          <div
            v-for="(exp, index) in experience"
            :key="index"
            class="flex gap-4"
          >
            <div class="flex flex-col items-center">
              <div class="size-10 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                <UIcon name="i-lucide-briefcase" class="size-4 text-primary" />
              </div>
              <div v-if="index < experience.length - 1" class="w-px flex-1 bg-border mt-2" />
            </div>
            <div class="pb-8">
              <div class="flex flex-wrap items-center gap-2 mb-1">
                <h3 class="font-semibold">
                  {{ exp.role }}
                </h3>
                <UBadge variant="subtle" size="sm">{{ exp.company }}</UBadge>
              </div>
              <p class="text-muted text-sm mb-2">
                {{ exp.period }}
              </p>
              <p class="text-muted">
                {{ exp.description }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </UContainer>
  </div>
</template>
