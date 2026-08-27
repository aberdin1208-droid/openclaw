FROM ghcr.io/openclaw/openclaw:latest
ENV NODE_ENV=production
ENV PORT=10000
ENV OPENCLAW_GATEWAY_PORT=10000
EXPOSE 10000
CMD ["openclaw", "gateway", "--allow-unconfigured"]
