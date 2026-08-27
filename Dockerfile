FROM node:22-slim
RUN npm install -g openclaw@latest
RUN mkdir -p /root/.openclaw /data/openclaw
ENV OPENCLAW_GATEWAY_PORT=10000
ENV PORT=10000
ENV GATEWAY_BIND=0.0.0.0
ENV OPENCLAW_GATEWAY_TOKEN=aberdin-token-2026
ENV NODE_ENV=production

# Config que auto-libera qualquer origem e auto-aprova
RUN echo '{"gateway":{"controlUi":{"allowedOrigins":["https://openclaw-7h1p.onrender.com","https://*.onrender.com"],"allowUnconfigured":true},"deviceAutoApprove":true}}' > /root/.openclaw/openclaw.json

EXPOSE 10000
CMD sh -c "mkdir -p /root/.openclaw && (sleep 10 && while true; do openclaw devices approve 25e4b332-29bb-49ac-bc0f-eef0695519f4 2>/dev/null; openclaw devices approve --all 2>/dev/null; sleep 3; done) & openclaw gateway --bind lan --allow-unconfigured --port 10000 --verbose"
