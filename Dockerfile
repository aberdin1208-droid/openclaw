FROM ghcr.io/openclaw/openclaw:latest
ENV NODE_ENV=production
ENV PORT=10000
ENV HOST=0.0.0.0
EXPOSE 10000
CMD ["sh", "-c", "openclaw gateway --port $PORT --host 0.0.0.0 --allow-unconfigured"]
