#Utilisé une image officielle de bun https://hub.docker.com/r/oven/bun/tags
FROM oven/bun:1 AS base
#Définir le répertoire de travail
WORKDIR /src
#copier les fichiers de cofiguration et les dépendance du projet
COPY bun.lockb package.json tsconfig.json ./
#installer les dépendances
RUN bun install
#copier le reste des fichier du projet
COPY . .
#compiler ou construis le projet
RUN bun build || echo "Aucune étape de build n'est requis"
#exposé le port 
EXPOSE 9999
#les commandes pour exécuter l'application
CMD [ "bun", "dev" ]