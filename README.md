# Kong-OIDC
A containerised Kong gateway instance configured with [OIDC plugin](https://github.com/nokia/kong-oidc) and using [declarative configuration in DB-less mode](https://docs.konghq.com/gateway/latest/production/deployment-topologies/db-less-and-declarative-config/).

## Prerequisites 
 - Docker 
 - OAuth 2.0 Credentials (for Google cloud example, see [this](https://developers.google.com/identity/openid-connect/openid-connect))
 - OAuth 2.0 should have `https://mockbin.org/` as an authorized redirect url
 
 ## How to Run 
  - Insert OAuth 2.0 `client_id` and `client_secret` into `.env` 
  - Run `docker-compose up` 
 
Navigating to `localhost:8000/mock` in the broswer should prompt you to sign in using the chosen identity provider. Upone successful login, you should be redirected to `https://mockbin.org/`.
