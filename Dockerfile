FROM node:22-slim

ENV NODE_ENV=production

RUN npm i -g openclaw@latest

WORKDIR /app

EXPOSE 10000

CMD ["sh", "-c", "openclaw gateway --bind lan --port ${PORT:-10000} --allow-unconfigured"]
