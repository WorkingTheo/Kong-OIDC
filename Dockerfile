FROM bhgedigital/envsubst:latest
USER root

ARG CLIENT_ID 
ARG CLIENT_SECRET

ENV CLIENT_ID=$CLIENT_ID
ENV CLIENT_SECRET=$CLIENT_SECRET

COPY ./config/kong.yml /kong_def.yml
RUN envsubst < /kong_def.yml > /kong.yml

FROM kong:2.2-alpine
USER root

COPY kong.conf /etc/kong/

COPY --from=0 /kong.yml /opt/kong/kong.yml
COPY ./plugins/oidc /custom-plugins/oidc

WORKDIR /custom-plugins/oidc
RUN luarocks make

USER kong
