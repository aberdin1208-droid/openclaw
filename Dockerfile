FROM node:22-bookworm-slim
RUN npm install -g openclaw@latest --omit=dev && npm cache clean --force && mkdir -p /root/.openclaw
RUN printf '%s' '{"gateway":{"mode":"local","controlUi":{"allowedOrigins":["https://openclaw-7h1p.onrender.com","https://app.openclaw.bot","https://openclaw.ai"],"dangerouslyDisableDeviceAuth":true}}}' > /root/.openclaw/openclaw.json
ENV NODE_ENV=production
ENV PORT=18789
ENV OPENCLAW_GATEWAY_PORT=18789
ENV OPENCLAW_GATEWAY_CONTROL_UI_DANGEROUSLY_DISABLE_DEVICE_AUTH=true
EXPOSE 18789
CMD ["openclaw","gateway","run","--bind","lan","--port","18789","--allow-unconfigured"]
