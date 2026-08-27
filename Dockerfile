FROM node:22-slim

# CAMADA 1 - ENV mais forte que JSON (o que você descobriu)
ENV OPENCLAW_CONTROL_UI_DANGEROUSLY_DISABLE_DEVICE_AUTH=true
ENV OPENCLAW_CONTROL_UI_DISABLE_DEVICE_AUTH=true
# Fix pro EMFILE que você tá vendo
ENV CHOKIDAR_USEPOLLING=true

RUN npm i -g openclaw@latest

# CAMADA 2 - JSON garantido
RUN mkdir -p /root/.openclaw && \
  echo '{"controlUi":{"dangerouslyDisableDeviceAuth":true},"gateway":{"reload":{"mode":"off"}}}' > /root/.openclaw/openclaw.json

# CAMADA 3 - Limpeza total de pareamento
RUN rm -rf /root/.openclaw/devices \
           /root/.openclaw/devices-pending.json \
           /root/.openclaw/credentials \
           /root/.openclaw/identity

EXPOSE 8080
CMD ["openclaw", "gateway", "--bind", "0.0.0.0:8080", "--allow-unconfigured"]
