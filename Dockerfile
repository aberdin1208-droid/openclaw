FROM node:22-slim

ENV NODE_ENV=production

RUN npm i -g openclaw@latest

WORKDIR /app

RUN mkdir -p /root/.openclaw && \
  echo '{"gateway":{"controlUi":{"allowedOrigins":["https://openclaw-7h1p.onrender.com","https://wss.openclaw-7h1p.onrender.com","https://dashboard.render.com"]}}}' > /root/.openclaw/openclaw.json

EXPOSE 10000

CMD ["sh", "-c", "openclaw gateway --bind lan --port ${PORT:-10000} --allow-unconfigured"]
