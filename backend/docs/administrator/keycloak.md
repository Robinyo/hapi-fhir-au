<h1 align="center">Working with Keycloak</h1>

### Importing and Exporting Realms

#### Export

To export the `hapi-fhir-dev` realm to a single file (development-realm.json):

```
docker compose stop
docker compose -f docker-compose-keycloak-realm-export.yml up
docker compose -f docker-compose-keycloak-realm-export.yml stop
docker compose -f docker-compose-keycloak-realm-export.yml down
docker compose up
```

#### Import

Keycloak will **import** the `hapi-fhir-dev` realm when it starts up:

```
  keycloak.au.localhost:
    container_name: keycloak.au.localhost
    
    ...

    command:
      [
        'start',
        '-Dkeycloak.migration.action=import',
        '-Dkeycloak.migration.provider=singleFile',
        '-Dkeycloak.migration.realmName=hapi-fhir-dev',
        '-Dkeycloak.migration.strategy=OVERWRITE_EXISTING',
        '-Dkeycloak.migration.file=/import/development-realm.json',
      ]
```

**Reference:** [Server Administration Guide - Importing and Exporting Realms](https://www.keycloak.org/server/importExport)
