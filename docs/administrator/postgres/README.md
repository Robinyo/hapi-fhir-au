<h1 align="center">Working with PostgreSQL and pgAdmin</h1>

## ❯ PostgreSQL

### Docker Compose

Using Docker Compose to launch your PostgreSQL database and supporting services is a straightforward process.

You need to specify a PostgreSQL image, define environment variables for database credentials, volumes for persistent 
storage, and port mapping for external access.

For example:

```
services:

  postgres:
    container_name: postgres
    build:
      context: ./services/postgres
      dockerfile: Dockerfile
    ports:
      - 5432:5432
    environment:
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    env_file:
      - ./.env
    volumes:
      - postgres_data:/var/lib/postgresql/data
  
    ...

```

See: [docker-compose-apisix.yml](https://github.com/Robinyo/hapi-fhir-au/blob/main/backend/docker-compose-apisix.yml)

### Enable TLS

Support for encrypted connections is enabled by setting the `ssl` parameter to `on`. The server will listen for both 
normal and secure connections on the same port. Connecting clients can be required to use encrypted connections by 
setting the environment variable `PGSSLMODE` to `require`.

PostgreSQL also requires access to the files containing the server certificate and private key. 

For example:

```
services:

  postgres:
    container_name: postgres
    
    ...
    
    command: >
      -c ssl=on 
      -c ssl_cert_file=/var/lib/postgresql/server.crt 
      -c ssl_key_file=/var/lib/postgresql/server.key
    environment:
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      PGSSLMODE: require
    env_file:
      - ./.env      
    volumes:
      - '${PWD}/certs/cert.pem:/var/lib/postgresql/server.crt'
      - '${PWD}/certs/key.pem:/var/lib/postgresql/server.key'
      - postgres_data:/var/lib/postgresql/data
      
    ...

```

**Note:** On Unix and MacOS systems, the cert, key and keystore file permissions must disallow any access to world or group.

For example:

```
sudo chmod 600 *.pem
```

## ❯ pgAdmin

You can use [pgAdmin](https://www.pgadmin.org/) to manage PostrgeSQL.

Navigate to the pgAdmin Login page: https://hapi-fhir.au.localhost:5443

<p align="center">
  <img src="./pgadmin-login.png" alt="Login to pgAdmin"/>
</p>

Login using the PGADMIN_DEFAULT_EMAIL (admin@hapi-fhir.au) and PGADMIN_DEFAULT_PASSWORD (secret) credentials.

You should see something like:

<p align="center">
  <img src="./pgadmin-welcome-page.png" alt="Welcome Page"/>
</p>

In the 'Quick Links' click on 'Add New Server':

<p align="center">
  <img src="./pgadmin-register-server-general-tab.png" alt="Register Server - General Tab"/>
</p>

Enter the Name (PostgreSQL) and then click on the 'Connection' tab:

<p align="center">
  <img src="./pgadmin-register-server-connection-tab.png" alt="Register Server - Connection Tab"/>
</p>

Enter the Host name / address (postgres) and the PostgreSQL Username (POSTGRES_USER=admin) and Password (POSTGRES_PASSWORD=secret), then click the 'Save' button:

**Note:** The 'Host name / address' field must match the value (e.g., postgres) specified in the project's docker-compose.yml.

You can use the Object Explorer to browse the database:

<p align="center">
  <img src="./pgadmin-object-explorer.png" alt="Object Explorer"/>
</p>

![divider](../../divider.png)

## ❯ References

### pgAdmin

* PostgreSQL: [Documentation](https://www.postgresql.org/docs/current/index.html)
* pgAdmin: [Documentation](https://www.pgadmin.org/docs/pgadmin4/latest/index.html)