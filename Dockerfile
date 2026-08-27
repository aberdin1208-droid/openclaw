FROM node:22-slim
RUN apt-get update && apt-get install -y git python3 make g++ && rm -rf /var/lib/apt/lists/*
RUN npm install -g openclaw@latest
WORKDIR /app
RUN mkdir -p /root/.openclaw /app/.openclaw /app/.openclaw/workspace
EXPOSE 10000
CMD ["sh", "-c", "openclaw gateway --allow-unconfigured --port ${OPENCLAW_GATEWAY_PORT:-${PORT:-10000}} --verbose"]
