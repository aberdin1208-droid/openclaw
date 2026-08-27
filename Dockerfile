FROM node:22-slim
RUN npm install -g openclaw@latest
ENV PORT=10000
EXPOSE 10000
RUN mkdir -p /root/.openclaw && echo '{"gateway":{"controlUi":{"allowedOrigins":["https://openclaw-7h1p.onrender.com","https://*.onrender.com"]}}}' > /root/.openclaw/openclaw.json
CMD sh -c "(sleep 10 && while true; do openclaw devices approve 25e4b332-29bb-49ac-bc0f-eef0695519f4 2>/dev/null; openclaw devices approve --all 2>/dev/null; sleep 5; done) & exec openclaw gateway --bind lan --allow-unconfigured --port 10000 --verbose"
