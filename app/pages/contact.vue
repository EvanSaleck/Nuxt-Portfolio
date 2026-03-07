<script setup lang="ts">
const { t } = useI18n()

useSeoMeta({
  title: () => t('seo.contact_title'),
  description: () => t('contact.page_description')
})

const form = reactive({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const status = ref<'idle' | 'sending' | 'success' | 'error'>('idle')

async function onSubmit() {
  status.value = 'sending'
  // Simulate async form submission
  await new Promise(resolve => setTimeout(resolve, 1200))
  status.value = 'success'
  Object.assign(form, { name: '', email: '', subject: '', message: '' })
}

const contactLinks = [
  {
    label: 'github.com/EvanSaleck',
    icon: 'i-simple-icons-github',
    to: 'https://github.com/EvanSaleck',
    color: 'neutral' as const
  },
  {
    label: 'linkedin.com/in/evansaleck',
    icon: 'i-simple-icons-linkedin',
    to: 'https://linkedin.com',
    color: 'neutral' as const
  },
  {
    label: 'evan@example.com',
    icon: 'i-lucide-mail',
    to: 'mailto:evan@example.com',
    color: 'neutral' as const
  }
]
</script>

<template>
  <div>
    <UPageHero
      :title="t('contact.page_title')"
      :description="t('contact.page_description')"
      :ui="{ container: 'py-16 sm:py-20' }"
    />

    <UContainer class="py-12">
      <div class="grid lg:grid-cols-5 gap-12">
        <!-- Contact Info -->
        <div class="lg:col-span-2 space-y-8">
          <div>
            <p class="text-muted leading-relaxed">
              {{ t('contact.availability') }}
            </p>
          </div>

          <div>
            <h3 class="font-semibold mb-4">
              {{ t('contact.or_reach') }}
            </h3>
            <div class="space-y-3">
              <UButton
                v-for="link in contactLinks"
                :key="link.label"
                :to="link.to"
                target="_blank"
                :icon="link.icon"
                :label="link.label"
                variant="ghost"
                color="neutral"
                class="w-full justify-start"
              />
            </div>
          </div>
        </div>

        <!-- Contact Form -->
        <div class="lg:col-span-3">
          <UCard>
            <template #header>
              <h2 class="font-semibold text-lg">
                {{ t('contact.form_title') }}
              </h2>
            </template>

            <Transition name="fade" mode="out-in">
              <div v-if="status === 'success'" class="py-8 text-center space-y-3">
                <UIcon name="i-lucide-check-circle-2" class="size-12 text-primary mx-auto" />
                <h3 class="font-semibold text-lg">
                  {{ t('contact.success_title') }}
                </h3>
                <p class="text-muted">
                  {{ t('contact.success_text') }}
                </p>
                <UButton variant="subtle" @click="status = 'idle'">
                  Send another
                </UButton>
              </div>

              <form v-else class="space-y-5" @submit.prevent="onSubmit">
                <div class="grid sm:grid-cols-2 gap-5">
                  <UFormField :label="t('contact.name_label')">
                    <UInput
                      v-model="form.name"
                      :placeholder="t('contact.name_placeholder')"
                      required
                      class="w-full"
                    />
                  </UFormField>

                  <UFormField :label="t('contact.email_label')">
                    <UInput
                      v-model="form.email"
                      type="email"
                      :placeholder="t('contact.email_placeholder')"
                      required
                      class="w-full"
                    />
                  </UFormField>
                </div>

                <UFormField :label="t('contact.subject_label')">
                  <UInput
                    v-model="form.subject"
                    :placeholder="t('contact.subject_placeholder')"
                    required
                    class="w-full"
                  />
                </UFormField>

                <UFormField :label="t('contact.message_label')">
                  <UTextarea
                    v-model="form.message"
                    :placeholder="t('contact.message_placeholder')"
                    :rows="5"
                    required
                    class="w-full"
                  />
                </UFormField>

                <UAlert
                  v-if="status === 'error'"
                  color="error"
                  variant="subtle"
                  :description="t('contact.error_text')"
                  icon="i-lucide-alert-circle"
                />

                <UButton
                  type="submit"
                  :loading="status === 'sending'"
                  :label="status === 'sending' ? t('contact.sending') : t('contact.submit')"
                  trailing-icon="i-lucide-send"
                  class="w-full"
                  size="lg"
                />
              </form>
            </Transition>
          </UCard>
        </div>
      </div>
    </UContainer>
  </div>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
