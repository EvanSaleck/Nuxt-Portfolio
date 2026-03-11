<script setup lang="ts">
const { t, tm, rt } = useI18n()

interface TimelineItemType {
  date: string
  title: string
  description: string
  icon: string
  isOngoing?: boolean
}

interface StudyType {
  period: string
  degree: string
  institution: string
  description: string
  icon?: string
  isOngoing?: boolean
}

interface ExperienceType {
  period: string
  role: string
  company: string
  description: string
  icon?: string
  isOngoing?: boolean
}

const studies = computed<TimelineItemType[]>(() => {
  const studiesArray = tm('experience.studies') as StudyType[] || []

  return [...studiesArray].map((study) => {
    return {
      date: rt(study.period),
      title: `${rt(study.degree)} - ${rt(study.institution)}`,
      description: rt(study.description),
      icon: study.icon ? rt(study.icon) : 'i-lucide-graduation-cap'

    }
  })
})

const experiences = computed<TimelineItemType[]>(() => {
  const expArray = tm('experience.experience') as ExperienceType[] || []

  return expArray.map((exp) => {
    return {
      date: rt(exp.period),
      title: `${rt(exp.role)} @ ${rt(exp.company)}`,
      description: rt(exp.description),
      icon: exp.icon ? rt(exp.icon) : 'i-lucide-briefcase'
    }
  })
})
</script>

<template>
  <UContainer
    id="experience"
    class="py-20"
  >
    <div class="mb-12">
      <h2 class="text-3xl font-bold text-primary mb-2">
        {{ t("experience.page_title") }}
      </h2>
      <p class="text-muted text-lg text-neutral">
        {{ t("experience.page_description") }}
      </p>
    </div>
    <div class="flex flex-col md:flex-row gap-28">
      <div>
        <h4 class="text-2xl font-semibold text-primary mb-4">
          {{ t("experience.studies_title") }}
        </h4>

        <UTimeline
          color="primary"
          :items="studies"
          :default-value="1"
        />
      </div>

      <div>
        <h4 class="text-2xl font-semibold text-primary mb-4">
          {{ t("experience.experience_title") }}
        </h4>

        <UTimeline
          color="primary"
          :items="experiences"
        />
      </div>
    </div>
  </UContainer>
</template>
