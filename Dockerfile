FROM node:22-slim

ENV NODE_ENV=production

RUN npm i -g openclaw@latest

WORKDIR /app

RUN mkdir -p /root/.openclaw /root/.openclaw/workspace && \
  echo '{"controlUi":{"dangerouslyDisableDeviceAuth":true,"allowedOrigins":["https://openclaw-7h1p.onrender.com","https://wss-openclaw-7h1p.onrender.com","https://dashboard.render.com"]},"gateway":{"reload":{"mode":"off"}}}' > /root/.openclaw/openclaw.json && \
  rm -rf /root/.openclaw/devices /root/.openclaw/devices-pending.json /root/.openclaw/credentials /root/.openclaw/identity

EXPOSE 10000

CMD ["openclaw", "gateway", "--bind", "lan", "--port", "10000", "--allow-unconfigured"]
