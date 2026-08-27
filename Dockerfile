FROM node:22-slim
RUN npm install -g openclaw@latest
ENV PORT=10000
EXPOSE 10000
RUN mkdir -p /root/.openclaw && echo '{"gateway":{"controlUi":{"allowedOrigins":["https://openclaw-7h1p.onrender.com","https://*.onrender.com"],"dangerouslyDisableDeviceAuth":true}}}' > /root/.openclaw/openclaw.json
CMD ["openclaw", "gateway", "--bind", "lan", "--allow-unconfigured", "--port", "10000", "--verbose"]
