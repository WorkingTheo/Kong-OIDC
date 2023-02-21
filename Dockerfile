FROM kong:2.2-alpine
USER root

ARG CLIENT_ID 
ARG CLIENT_SECRET

ENV CLIENT_ID $CLIENT_ID
ENV CLIENT_SECRET $CLIENT_SECRET

COPY kong.conf /etc/kong/
# COPY ./config /opt/kong

COPY ./config/kong.yml /opt/kong/kong.yml
RUN sed -i 's@${CLIENT_ID}@'"$CLIENT_ID"'@'  /opt/kong/kong.yml
RUN sed -i 's@${CLIENT_SECRET}@'"$CLIENT_SECRET"'@'  /opt/kong/kong.yml
COPY ./plugins/oidc /custom-plugins/oidc

WORKDIR /custom-plugins/oidc
RUN luarocks make

USER kong
