# Utiliser l'image Nginx officielle
FROM nginx:latest

# Supprimer la page par défaut de Nginx
RUN rm /usr/share/nginx/html/index.html

# Copier notre page personnalisée
COPY index.html /usr/share/nginx/html/index.html

# Exposer le port 80
EXPOSE 80
