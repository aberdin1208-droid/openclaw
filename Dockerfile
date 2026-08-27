FROM node:22-slim
RUN npm install -g openclaw@latest
ENV PORT=10000
EXPOSE 10000
RUN mkdir -p /root/.openclaw && echo '{"gateway":{"controlUi":{"allowedOrigins":["https://openclaw-7h1p.onrender.com","https://*.onrender.com"]}}}' > /root/.openclaw/openclaw.json
CMD sh -c "(sleep 8 && while true; do for id in $(openclaw devices list 2>&1 | grep -Eo '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}'); do openclaw devices approve $id 2>/dev/null; done; openclaw devices approve 7907c3e7-eaa0-4d8b-9ca0-6c5f79faaf5c 2>/dev/null; openclaw devices approve 25e4b332-29bb-49ac-bc0f-eef0695519f4 2>/dev/null; sleep 2; done) & exec openclaw gateway --bind lan --allow-unconfigured --port 10000 --verbose"
