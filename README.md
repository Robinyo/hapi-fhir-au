<p align="center">
  <img src="./logo.svg" alt="HAPI FHIR AU with Auth Starter Project" width="400"/>
</p>

<h1 align="center">HAPI FHIR AU Starter Project</h1>

<p align="center">
  <b>A HAPI FHIR Starter Project with support for AuthN and AuthZ.</b> <br>
</p>

<p align="center">
  The goal of this project is to demonstrate secure access to FHIR resources. <br>
</p>

<p align="center">
  TLS is used to encrypt <b>data in transit</b> and AES to encrypt <b>data at rest</b>.
</p>

<p align="center">
  OpenID Connect is used for authentication and OAuth 2.0 (e.g., SMART on FHIR) for authorisation. <br>
</p>

<p align="center">
  HAPI FHIR Server Version: 8.0.0 <br>
  FHIR Version: 4.0.1 (R4) <br>
</p>

![divider](./divider.png)

## ❯ Documentation

* Developer Documentation
  * [Quick Start Guide](./docs/developer/quick-start-guide/README.md)
  * [mkcert](./docs/developer/mkcert/README.md)
* Administrator Documentation
  * [Working with APISIX](./docs/administrator/apisix/README.md)
  * [Working with Docker](./docs/administrator/docker/README.md)
  * [Working with Keycloak](./docs/administrator/keycloak/README.md)
  * [Working with HAPI FHIR](./docs/administrator/hapi-fhir/README.md)
  * [Working with PostgreSQL](./docs/administrator/postgres/README.md)
  * [Working with pgAdmin](./docs/administrator/pgadmin/README.md)
  * [Working with the Percona Distribution for PostgreSQL](./docs/administrator/percona-distribution-for-postgresql/README.md)

![divider](./divider.png)

## ❯ Resources

* Rob Ferguson's blog: [Getting Started with HAPI FHIR](https://rob-ferguson.me/getting-started-with-hapi-fhir/)
* Rob Ferguson's blog: [HAPI FHIR and FHIR Implementation Guides](https://rob-ferguson.me/hapi-fhir-and-fhir-implementation-guides/)
* Rob Ferguson's blog: [HAPI FHIR and AU Core Test Data](https://rob-ferguson.me/hapi-fhir-and-au-core-test-data/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 1](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-1/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 2](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-2/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 3](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-3/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 4](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-4/)
* Rob Ferguson's blog: [Add AuthZ to HAPI FHIR - Part 1](https://rob-ferguson.me/add-authz-to-hapi-fhir-1/)
* Rob Ferguson's blog: [Add AuthZ to HAPI FHIR - Part 2](https://rob-ferguson.me/add-authz-to-hapi-fhir-2/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with APISIX and Keycloak](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-apisix-and-keycloak/)
* Rob Ferguson's blog: [Add support for SMART on FHIR to HAPI FHIR with APISIX and Keycloak](https://rob-ferguson.me/add-authz-to-hapi-fhir-with-apisix-and-keycloak/)
* Rob Ferguson's blog: [Getting started with the APISIX authz-keycloak plugin](https://rob-ferguson.me/getting-started-with-the-apisix-authz-keycloak-plugin/)
* Rob Ferguson's blog: [Secure HAPI FHIR data in transit](https://rob-ferguson.me/secure-hapi-fhir-data-in-transit/)
* Rob Ferguson's blog: [Secure HAPI FHIR data at rest](https://rob-ferguson.me/secure-hapi-fhir-data-at-rest/)

![divider](./divider.png)

## ❯ References

### System Hardening

* Australian Signals Directorate: [Implementing Certificates, TLS, HTTPS and Opportunistic TLS](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/web-hardening/implementing-certificates-tls-https-and-opportunistic-tls)
* Cloudflare docs: [Cipher suites recommendations](https://developers.cloudflare.com/ssl/edge-certificates/additional-options/cipher-suites/recommendations/)

### OAuth 2.0

* IETF: [OAuth 2.0 for Browser-Based Applications](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-browser-based-apps)
* Spring docs: [Implementation Guidelines for Browser-Based Applications](https://github.com/spring-projects/spring-authorization-server/issues/297#issue-896744390)
* okta Developer blog: [OAuth for Java Developers](https://developer.okta.com/blog/2022/06/16/oauth-java)
* OAuth.com: [OAuth 2.0 Playground](https://www.oauth.com/playground/?_gl=1*1fwid4n*_gcl_au*MjEyMTY2MzU4NS4xNzM1MDI2MjQ4*_ga*MTk3OTgwNDIxNS4xNzM1MDI2MjQ4*_ga_QKMSDV5369*MTczNjAyMjIyMS42LjEuMTczNjAyMjkyOS41Ny4wLjA.)

### HL7

* HL7: [Implementation Guide](https://www.hl7.org/fhir/implementationguide.html)
* HL7: [FHIR NPM Packages](https://hl7.org/fhir/packages.html)
* AU Core: [Publication (Version) History](https://hl7.org.au/fhir/core/history.html)
* AU Core FHIR Implementation Guide: [AU Core - 1.0.0-preview](https://hl7.org.au/fhir/core/1.0.0-preview/index.html)
* AU Core FHIR Implementation Guide: [Testing FAQs](https://confluence.hl7.org/display/HAFWG/AU+Core+FHIR+IG+Testing+FAQs)
* Sparked AU Core Test Data [Postman collection](https://github.com/hl7au/au-fhir-test-data/blob/master/Postman/Sparked%20AUCore%20Test%20Data.postman_collection.json)

### SMART on FHIR

* HL7: [SMART App Launch](https://build.fhir.org/ig/HL7/smart-app-launch/)
* SMART Health IT: [SMART on FHIR](https://docs.smarthealthit.org/)
* Google Group: [SMART on FHIR](https://groups.google.com/g/smart-on-fhir)

#### SMART on FHIR - Standalone Launch

* Project Alvearie: [SMART App Launch](https://alvearie.io/blog/smart-keycloak/)
* Project Alvearie: [Keycloak extensions for FHIR](https://github.com/Alvearie/keycloak-extensions-for-fhir)
* Keycloak extensions for FHIR: [Upgrade to the Quarkus-based distribution](https://github.com/Alvearie/keycloak-extensions-for-fhir/issues/64)
* Keycloak discussion: [Fine grained scope consent management](https://github.com/keycloak/keycloak/discussions/10303)

#### SMART on FHIR - EHR Launch

* GitHub: [Zedwerks - Keycloak extensions for FHIR](https://github.com/zedwerks/keycloak-smart-fhir)

### Keycloak

* Keycloak docs: [Configuring Keycloak for production](https://www.keycloak.org/server/configuration-production)
* Keycloak docs: [Configuring TLS](https://www.keycloak.org/server/enabletls)
* Keycloak docs: [Configuring trusted certificates](https://www.keycloak.org/server/keycloak-truststore)
* Keycloak docs: [Configuring the hostname](https://www.keycloak.org/server/hostname)
* Keycloak docs: [Using a reverse proxy](https://www.keycloak.org/server/reverseproxy)
* Keycloak docs: [Running Keycloak in a container](https://www.keycloak.org/server/containers)
* Keycloak docs: [Migrating to the Quarkus distribution](https://www.keycloak.org/migration/migrating-to-quarkus)
* Keycloak docs: [Upgrading Guide - 26.1.0](https://www.keycloak.org/docs/latest/upgrading/)
* Keycloak docs: [Authorization Services Guide](https://www.keycloak.org/docs/latest/authorization_services/index.html)

### Keycloak-based  Development

* GitHub: [Keycloak Project Example](https://github.com/thomasdarimont/keycloak-project-example)
* GitHub: [Awesome Keycloak](https://github.com/thomasdarimont/awesome-keycloak)

### Keycloak Support

* Google Group: [Keycloak User](https://groups.google.com/g/keycloak-user)
* Google Group: [Keycloak Dev](https://groups.google.com/g/keycloak-dev)

### APISIX

* APISIX: [Documentation](https://apisix.apache.org/docs/)
* APISIX docs: [Deployment modes](https://apisix.apache.org/docs/apisix/deployment-modes/#standalone)
* APISIX docs: [SSL Protocol](https://apisix.apache.org/docs/apisix/ssl-protocol/)
* APISIX docs: [Certificate](https://apisix.apache.org/docs/apisix/certificate/)
* APISIX docs: [openid-connect plugin](https://apisix.apache.org/docs/apisix/plugins/openid-connect/)
* APISIX docs: [authz-keycloak plugin](https://apisix.apache.org/docs/apisix/plugins/authz-keycloak/)
* API7 docs: [authz-keycloak plugin](https://docs.api7.ai/hub/authz-keycloak)
* APISIX docs: [Code Samples](https://apisix.apache.org/docs/general/code-samples/)

### Nginx

* Nginx docs: [NGINX SSL Termination](https://docs.nginx.com/nginx/admin-guide/security-controls/terminating-ssl-http/)
* Nginx docs: [Authentication Based on Subrequest Result](https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-subrequest-authentication/)

### OAuth2 Proxy

* OAuth2 Proxy docs: [Integration](https://oauth2-proxy.github.io/oauth2-proxy/configuration/integration)
* OAuth2 Proxy docs: [TLS Configuration](https://oauth2-proxy.github.io/oauth2-proxy/configuration/tls/)

### HAPI FHIR

* HAPI FHIR: [Website](https://hapifhir.io/)
* HAPI FHIR: [Documentation](https://hapifhir.io/hapi-fhir/docs/)
* Google Group: [HAPI FHIR](https://groups.google.com/g/hapi-fhir)

### Terminology

* HL7 Australia: [Terminology](https://confluence.hl7.org/display/HAFWG/Terminology)
* ADHA: [National Clinical Terminology Service](https://www.healthterminologies.gov.au/)

### Clinical Information Systems

#### Oracle Health Millennium Platform

* Oracle Health Millennium Platform: [Authorization Framework](https://docs.oracle.com/en/industries/health/millennium-platform-apis/fhir-authorization-framework/#authorization)
* Oracle Health Millennium Platform: [FHIR R4 APIs](https://docs.oracle.com/en/industries/health/millennium-platform-apis/mfrap/rest-endpoints.html)

#### Smile Digital Health

* Smile CDR docs: [SMART on FHIR - Introduction](https://smilecdr.com/docs/smart/smart_on_fhir_introduction.html)
* Smile CDR docs: [SMART on FHIR - Supported Scopes](https://smilecdr.com/docs/smart/smart_on_fhir_smile_cdr.html#smile-cdr-supported-smart-scopes)

### okta

* okta Developer blog: [Add Auth to Any App with OAuth2 Proxy](https://developer.okta.com/blog/2022/07/14/add-auth-to-any-app-with-oauth2-proxy)
* okta forum: [SMART on FHIR wildcard scopes](https://devforum.okta.com/t/creating-wildcard-custom-scopes-for-oauth2/27418)
* GitHub: [Okta SMART on FHIR Setup Guide - scopes](https://github.com/oktadev/okta-smartfhir-docs/blob/original-v1-documentation/SETUP.md#scopes)

### Miscellaneous 

* ADHA: [Strategies and plans](https://www.digitalhealth.gov.au/about-us/strategies-and-plans)
* ADHA: [Digital Health Standards Catalogue](https://developer.digitalhealth.gov.au/standards/search?keywords=&category=All&organisation=All)
