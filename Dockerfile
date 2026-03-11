# 1. Étape de construction (Environnement 100% Linux propre)
FROM node:20-slim AS builder

WORKDIR /app

# On copie d'abord juste les fichiers de dépendances pour utiliser le cache Docker
COPY package*.json ./

# On installe proprement (sans l'interférence de Nixpacks)
RUN npm ci

# On copie tout le reste du projet
COPY . .

# On lance le build Nuxt
RUN npm run build

# 2. Étape de production (On garde juste le strict minimum pour un serveur ultra-léger)
FROM node:20-slim AS runner

WORKDIR /app

# On récupère le dossier compilé de l'étape 1
COPY --from=builder /app/.output ./.output

# On configure les variables pour Nuxt
ENV HOST=0.0.0.0
ENV PORT=3000
ENV NODE_ENV=production

# On expose le port 3000
EXPOSE 3000

# Commande de démarrage
CMD ["node", ".output/server/index.mjs"]
