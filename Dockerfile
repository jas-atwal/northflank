FROM node:20-alpine
WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

ENV PORT=8080
EXPOSE 8080

# Check container health every 30s using wget against local endpoint
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/api/health || exit 1

CMD ["node", "server.js"]