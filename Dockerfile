FROM node:20-alpine

WORKDIR /app

# Create a lightweight web server file directly inside the container
RUN echo "const http = require('http'); \
const port = process.env.PORT || 8080; \
const server = http.createServer((req, res) => { \
  res.writeHead(200, { 'Content-Type': 'text/html' }); \
  res.end('<h1>Northflank Demo App</h1><p>Status: Running successfully!</p>'); \
}); \
server.listen(port, () => console.log('Demo running on port ' + port));" > server.js

ENV PORT=8080
EXPOSE 8080

CMD ["node", "server.js"]