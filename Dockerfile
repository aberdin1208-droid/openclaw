FROM node:22-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN npm install -g openclaw@latest

WORKDIR /app

RUN mkdir -p /root/.openclaw /app/.openclaw

EXPOSE 7860

CMD ["sh", "-c", "openclaw gateway --allow-unconfigured --port 7860"]
