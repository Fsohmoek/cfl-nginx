# Afficher la version de Docker
version:
    @echo "Vérification de la version de Docker installée."
    docker --version
    @echo "Cette commande affiche la version de Docker installée sur votre machine. Cela garantit que Docker est correctement installé."
    
# Afficher les informations Docker
info:
    @echo "Informations détaillées sur l’environnement Docker."
    docker info
    @echo "La commande docker info fournit des informations détaillées sur l’environnement Docker," 
    @echo "y compris le nombre de conteneurs, d’images, les pilotes de stockage, la version du moteur Docker," 
    @echo "et bien plus encore. Cela permet de comprendre l’état et la configuration de l’environnement Docker."
#Créer un conteneur Nginx simple
nginx:
    @echo "Création d'un simple conteneur Nginx."
    docker run -d --name cfl-nginx -p 8080:80 nginx
    @echo "•	docker run : Lance un nouveau conteneur."
    @echo "•	-d : Démarre le conteneur en mode “détaché” (en arrière-plan)."
    @echo "•	--name cfl-nginx : Nomme le conteneur cfl-nginx pour le rendre plus facile à identifier."
    @echo "•	-p 8080:80 : Mappe le port 8080 de la machine hôte au port 80 du conteneur (port par défaut de Nginx)."
    @echo "•	nginx : Indique que nous utilisons l’image officielle Nginx."
# Ouvrir l'URL dans le navigateur pour vérifier le résultat
open1:
    @echo "Rendez-vous sur l’URL suivante : http://localhost:8080."
    open http://localhost:8080
# Construire l'image Docker personnalisée
build:
    @echo "Construction une nouvelle image Docker Nginx personnalisée avec la page HTML personnalisée."
    docker build -t nginx-cfl .
# Docker images
images:
    @echo "Liste des images Docker disponibles sur votre machine locale."
    docker images
# Exécuter le conteneur Nginx personnalisé
run:
    @echo "Exécution du conteneur basé sur l’image nginx-cfl sur le port 8080."
    docker run -d --name cfl-nginxx -p 8081:80 nginx-cfl

# Ouvrir l'URL dans le navigateur pour vérifier le résultat
open2:
    @echo "Ouverture du navigateur par défaut pour accéder à la page Web servie par Nginx."
    open http://localhost:8081
# Lister les conteneurs 
    @echo "Liste des conteneurs en cours d’exécution."
    docker ps -a
    @echo "Ajouter l’option -a pour lister tous les conteneurs, y compris ceux qui sont arrêtés."
# Nettoyage des conteneurs et des images
clean:
    @echo "Suppression du conteneur en cours d’exécution et l’image Docker pour libérer de l’espace."
    docker stop $(docker ps -aq)
    docker rm -f $(docker ps -aq) || echo "Aucun conteneur à supprimer"
    docker rmi -f nginx-cfl || echo "Aucune image à supprimer"