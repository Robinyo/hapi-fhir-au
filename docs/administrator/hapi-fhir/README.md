<h1 align="center">Working with HAPI FHIR</h1>

## ❯ HAPI FHIR

### Enable TLS

HAPI FHIR relies on the underlying web server for TLS encryption.

All embedded web servers supported by Spring Boot can be configured to secure connections with TLS by using `server.ssl.*` properties.

HAPI FHIR also requires access to a keystore file containing the server certificate and private key. 

For example:

```
services:

  hapi-fhir:
    container_name: hapi-fhir
    build:
      context: ./services/hapi-fhir
      dockerfile: Dockerfile
    restart: unless-stopped
    ports:
      - 6443:8443      
    environment:
      SERVER_SSL_ENABLED: true
      SERVER_SSL_KEY_STORE_TYPE: PKCS12
      SERVER_SSL_KEY_STORE: file:/keystore/keystore.p12
      SERVER_SSL_KEY_STORE_PASSWORD: secret
      SERVER_SSL_KEY_ALIAS: tomcat
      SERVER_PORT: 8443
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/${POSTGRES_DB:-hapi-fhir}
      SPRING_DATASOURCE_USERNAME: ${POSTGRES_USER}
      SPRING_DATASOURCE_PASSWORD: ${POSTGRES_PASSWORD}
      SPRING_DATASOURCE_DRIVER_CLASS_NAME: org.postgresql.Driver
      SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT: ca.uhn.fhir.jpa.model.dialect.HapiFhirPostgresDialect
      SPRING_JPA_PROPERTIES_SEARCH_ENABLED: false
    env_file:
      - ./.env
    volumes:
      - '${PWD}/certs/keystore.p12:/keystore/keystore.p12'
    configs:
      - source: hapi
        target: /app/config/application.yaml
    depends_on:
      postgres:
        condition: service_healthy
      keycloak.au.localhost:
        condition: service_healthy
    networks:
      - hapi_fhir_network
```

## ❯ References

### pgAdmin

* PostgreSQL: [Documentation](https://www.postgresql.org/docs/current/index.html)
* pgAdmin: [Documentation](https://www.pgadmin.org/docs/pgadmin4/latest/index.html)