<h1 align="center">Working with Keycloak</h1>

### Permanent Admin Account

When you first start Keycloak you login using the Keycloak bootstrap username and password.

You should create a permanent admin account in the master realm and delete the temporary one.

For example:

<p align="center">
  <img src="./keycloak-create-admin-user.png" alt="Create Admin user"/>
</p>

Don't forget to assign the admin role (role_admin) to the permanent admin account:

<p align="center">
  <img src="./keycloak-assign-role-to-admin.png" alt="Assign role to Admin user"/>
</p>

And to set a password:

<p align="center">
  <img src="./keycloak-create-admin-user.png" alt="Create Admin User"/>
</p>

### Importing and Exporting Realms

#### Import a Realm

Keycloak can import a realm when it starts up.

For example:

```
  keycloak.au.localhost:

    ...
    
    command:
      [
        'start-dev',
        '-Dkeycloak.migration.action=import',
        '-Dkeycloak.migration.provider=singleFile',
        '-Dkeycloak.migration.realmName=hapi-fhir-dev',
        '-Dkeycloak.migration.strategy=OVERWRITE_EXISTING',
        '-Dkeycloak.migration.file=/import/development-realm.json',
        '--log-level=INFO,io.vertx.ext.web.impl.RouterImpl:TRACE',
      ]
      
    ...
      
    volumes:
      - '${PWD}:/import'
```

#### Export a Realm

Keycloak can export a realm when it starts up.

For example:

```
  keycloak.au.localhost:

    ...
    
    command:
      [
        'start-dev',
        '-Dkeycloak.migration.action=export',
        '-Dkeycloak.migration.provider=singleFile',
        '-Dkeycloak.migration.realmName=hapi-fhir-dev',
        '-Dkeycloak.migration.usersExportStrategy=REALM_FILE',
        '-Dkeycloak.migration.file=/export/development-realm.json',
        '--log-level=INFO,io.vertx.ext.web.impl.RouterImpl:TRACE',
      ]
      
    ...
      
    volumes:
      - '${PWD}:/export'
```

**Reference:** [Server Administration Guide - Importing and Exporting Realms](https://www.keycloak.org/server/importExport)
