# Déployer le modèle de données

Ci-dessous, quelques instructions pour aider au déploiement du modèle de données.

## Instructions

- Monter une base de données via docker-compose
```bash
docker-compose up --build -d
```

- Initialiser la base avec le modèle
```bash
psql service=batid-db -f core_data_structure.sql
```
