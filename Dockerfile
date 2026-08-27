FROM node:22-slim
RUN apt-get update && apt-get install -y git python3 make g++ && rm -rf /var/lib/apt/lists/*
RUN npm install -g openclaw@latest
WORKDIR /app
RUN mkdir -p /root/.openclaw /app/.openclaw /app/.openclaw/workspace
EXPOSE 10000
ENV PORT=10000
ENV GATEWAY_CONTROLUI_ALLOWEDORIGINS=https://openclaw-7h1p.onrender.com
ENV OPENCLAW_GATEWAY_CONTROLUI_ALLOWEDORIGINS=https://openclaw-7h1p.onrender.com
CMD ["sh", "-c", "mkdir -p /root/.openclaw && echo '{\"gateway\":{\"controlUi\":{\"allowedOrigins\":[\"https://openclaw-7h1p.onrender.com\"]}}}' > /root/.openclaw/openclaw.json && openclaw gateway --bind lan --allow-unconfigured --port ${OPENCLAW_GATEWAY_PORT:-${PORT:-10000}} --verbose"]
