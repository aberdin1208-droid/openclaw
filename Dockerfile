FROM node:22-bookworm

RUN npm install -g openclaw@latest

RUN mkdir -p /root/.openclaw

RUN echo '{"gateway":{"controlUi":{"allowedOrigins":["https://openclaw-7h1p.onrender.com","wss://openclaw-7h1p.onrender.com"],"dangerouslyDisableDeviceAuth":true}}}' > /root/.openclaw/openclaw.json

ENV PORT=18789
ENV OPENCLAW_GATEWAY_PORT=18789
ENV NODE_ENV=production

EXPOSE 18789

CMD ["sh","-c","openclaw gateway run --port ${PORT} --bind 0.0.0.0"]
