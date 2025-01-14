<p align="center">
  <img src="./logo.svg" alt="HAPI FHIR AU with Auth Starter Project" width="400"/>
</p>

<h1 align="center">HAPI FHIR AU with Auth Starter Project</h1>

<p align="center">
  <b>A sample HAPI FHIR with Auth Starter Project.</b> <br>
</p>

![divider](./divider.png)

## ❯ Quick Start

### Clone the project

Change the current working directory to the location where you want the cloned project to be:

```
cd ~/workspace
```

Clone the project by running the following command:

```
git clone git@github.com:Robinyo/hapi-fhir-au.git
``` 

### Enable TLS

#### Local Development

Follow the steps in the project's Developer Documentation to use 
[mkcert](./backend/docs/developer/mkcert.md) to create and install a local certificate authority and to generate the 
certificates required to enable TLS.

### Docker Compose

With a single command, you can create and start all the services:

```
cd ~/workspace/hapi-fhir-au/backend
docker compose up
```

**Note:** Docker Compose will look for an `.env` file in the current working directory.

Navigate to:

```
https://hapi-fhir.au.localhost
```

You should see something like:

<p align="center">
  <img src="./docs/quick-start-guide/oauth2-proxy-sign-in.png" alt="Sign in with OpenID Connect"/>
</p>

Click the 'Sign in with OpenID Connect' button.

**Note:** You can skip this step if you set `OAUTH2_PROXY_SKIP_PROVIDER_BUTTON: true`

<p align="center">
  <img src="./docs/quick-start-guide/keycloak-sign-in.png" alt="Sign in with your Keycloak Account"/>
</p>

Enter your username and password and then click the 'Sign In' button:

<p align="center">
  <img src="./docs/quick-start-guide/hapi-fhir-welcome-page.png" alt="HAPI FHIR Welcome page"/>
</p>

Your connection is secure:

<p align="center">
  <img src="./docs/quick-start-guide/your-connection-is-secure.png" alt="Your connection to HAPI FHIR is secure"/>
</p>

Navigate to the OpenAPI UI for the HAPI FHIR R4 Server:

```
https://hapi-fhir.au.localhost/fhir
```

You should see something like:

<p align="center">
  <img src="docs/quick-start-guide/hapi-fhir-openapi-ui.png" alt="HAPI FHIR OpenAPI UI"/>
</p>

**Note:** You can override the default FHIR Server Base URL, for example:

```
hapi:
  fhir:
    # server_address: http://localhost:8080/fhir
    server_address: https://hapi-fhir.au.localhost/fhir
```

See: [hapi.application.yaml](https://github.com/Robinyo/hapi-fhir-au/blob/main/backend/hapi.application.yaml)

To stop the services:

```
docker compose stop
```

To remove the services:

```
docker compose down
```

To remove the data volumes and network:

```
docker volume rm backend_postgres_data
docker volume rm backend_cache
docker network rm backend_default
```

### Keycloak

#### Admin Console

To navigate to the Keycloak Admin Console (username: admin and password: secret):

```
https://keycloak.au.localhost:8443
```

You should see something like:

<p align="center">
  <img src="./docs/quick-start-guide/keycloak-welcome-page.png" alt="Keycloak Admin Console Welcome page"/>
</p>

You can preview tokens in the Keycloak Admin Console, for example:

<p align="center">
  <img src="./docs/quick-start-guide/keycloak-generated-id-token.png" alt="Generated ID Token"/>
</p>

#### Account Console

Navigate to the Keycloak Account Console:

```
https://keycloak.au.localhost:8443/realms/hapi-fhir-dev/account
```

You should see something like:

<p align="center">
  <img src="./docs/quick-start-guide/keycloak-account-welcome-page.png" alt="Keycloak Account Console Welcome page"/>
</p>

#### Realm Export

To export the `hapi-fhir-dev` realm to a single file (development-realm.json):

```
docker compose stop
docker compose -f docker-compose-keycloak-realm-export.yml up
docker compose -f docker-compose-keycloak-realm-export.yml stop
docker compose -f docker-compose-keycloak-realm-export.yml down
docker compose up
```

#### Realm Import

Keycloak will import the `hapi-fhir-dev` realm when it starts up:

```
  keycloak:
    container_name: keycloak
    
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

### Miscellaneous

Check the logs:

```
docker logs --tail 100 oauth2-proxy
docker logs --tail 100 keycloak
```

Clean and build:

```
docker system prune
docker compose build
```

Misc:

```
docker container ps -a
docker container ls
docker image ls
docker volume ls
```

![divider](./divider.png)

## ❯ Resources

* Rob Ferguson's blog: [Getting Started with HAPI FHIR](https://rob-ferguson.me/getting-started-with-hapi-fhir/)
* Rob Ferguson's blog: [HAPI FHIR and FHIR Implementation Guides](https://rob-ferguson.me/hapi-fhir-and-fhir-implementation-guides/)
* Rob Ferguson's blog: [HAPI FHIR and AU Core Test Data](https://rob-ferguson.me/hapi-fhir-and-au-core-test-data/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 1](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-1/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 2](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-2/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 3](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-3/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 4](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-4/)

## ❯ References

### System Hardening

* Australian Signals Directorate: [Implementing Certificates, TLS, HTTPS and Opportunistic TLS](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/web-hardening/implementing-certificates-tls-https-and-opportunistic-tls)
* Cloudflare docs: [Cipher suites recommendations](https://developers.cloudflare.com/ssl/edge-certificates/additional-options/cipher-suites/recommendations/)

### OAuth 2.0

* IETF: [OAuth 2.0 for Browser-Based Applications](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-browser-based-apps)
* Spring docs: [Implementation Guidelines for Browser-Based Applications](https://github.com/spring-projects/spring-authorization-server/issues/297#issue-896744390)
* okta Developer blog: [OAuth for Java Developers](https://developer.okta.com/blog/2022/06/16/oauth-java)
* OAuth.com: [OAuth 2.0 Playground](https://www.oauth.com/playground/?_gl=1*1fwid4n*_gcl_au*MjEyMTY2MzU4NS4xNzM1MDI2MjQ4*_ga*MTk3OTgwNDIxNS4xNzM1MDI2MjQ4*_ga_QKMSDV5369*MTczNjAyMjIyMS42LjEuMTczNjAyMjkyOS41Ny4wLjA.)
* okta Developer blog: [Add Auth to Any App with OAuth2 Proxy](https://developer.okta.com/blog/2022/07/14/add-auth-to-any-app-with-oauth2-proxy)

### Keycloak

* Keycloak guides: [Configuring Keycloak for production](https://www.keycloak.org/server/configuration-production)
* Keycloak guides: [Configuring TLS](https://www.keycloak.org/server/enabletls)
* Keycloak guides: [Configuring trusted certificates](https://www.keycloak.org/server/keycloak-truststore)
* Keycloak guides: [Configuring the hostname](https://www.keycloak.org/server/hostname)
* Keycloak guides: [Using a reverse proxy](https://www.keycloak.org/server/reverseproxy)
* Keycloak guides: [Running Keycloak in a container](https://www.keycloak.org/server/containers)

### Nginx

* Nginx docs: [NGINX SSL Termination](https://docs.nginx.com/nginx/admin-guide/security-controls/terminating-ssl-http/)
* Nginx docs: [Authentication Based on Subrequest Result](https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-subrequest-authentication/)

### OAuth2 Proxy

* OAuth2 Proxy docs: [Integration](https://oauth2-proxy.github.io/oauth2-proxy/configuration/integration)
* OAuth2 Proxy docs: [TLS Configuration](https://oauth2-proxy.github.io/oauth2-proxy/configuration/tls/)
