<script setup lang="ts">
const { t, locale } = useI18n()

// Tu peux ajouter tes technos ici pour boucler dessus
const skills = [
  { name: 'Nuxt / Vue.js', icon: 'i-simple-icons-nuxtdotjs' },
  { name: 'TypeScript', icon: 'i-simple-icons-typescript' },
  { name: 'PHP / Symfony', icon: 'i-simple-icons-symfony' },
  { name: 'Robot Framework', icon: 'i-simple-icons-robotframework' },
  { name: 'C', icon: 'i-simple-icons-c' },
  { name: 'PostgreSQL', icon: 'i-simple-icons-postgresql' },
  { name: 'Docker', icon: 'i-simple-icons-docker' },
  { name: 'Tailwind CSS', icon: 'i-simple-icons-tailwindcss' },
  { name: 'Bootstrap', icon: 'i-simple-icons-bootstrap' },

  { name: 'Git / GitHub', icon: 'i-simple-icons-github' }
]
</script>

<template>
  <UContainer
    id="about"
    class="py-20"
  >
    <div class="mb-12">
      <h2 class="text-3xl font-bold text-primary mb-2">
        {{ t("about.page_title") }}
      </h2>
      <p class="text-muted text-lg text-neutral">
        {{ t("about.page_description") }}
      </p>
    </div>

    <div class="grid md:grid-cols-2 gap-24 items-start">
      <div>
        <h4 class="text-2xl font-semibold text-primary mb-4">
          {{ t("about.intro_title") }}
        </h4>
        <p class="text-muted text-lg mb-6 leading-relaxed">
          {{ t("about.intro_text") }}
        </p>
        <UButton
          :to="`/cv-${locale}.pdf`"
          target="_blank"
          color="primary"
          variant="solid"
          size="xl"
          icon="i-lucide-download"
          trailing-icon="i-lucide-arrow-right"
          class="shadow-lg shadow-primary/20 hover:shadow-primary/40 transition-shadow"
        >
          {{ t("about.download_cv") }}
        </UButton>
      </div>

      <div>
        <h4 class="text-2xl font-semibold text-primary mb-4">
          {{ t("about.skills_text") }}
        </h4>

        <div class="flex flex-wrap gap-3">
          <UBadge
            v-for="skill in skills"
            :key="skill.name"
            color="neutral"
            variant="outline"
            size="lg"
            class="px-4 py-2 flex items-center gap-2 hover:bg-slate-800 transition-colors cursor-default"
          >
            <UIcon
              :name="skill.icon"
              class="size-5 text-primary"
            />
            {{ skill.name }}
          </UBadge>
        </div>
      </div>
    </div>
  </UContainer>
</template>
