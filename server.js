const express = require('express');
const path = path = require('path');

const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.static(path.join(__dirname, 'public')));

// Place your health check endpoint here:
app.get('/api/health', (req, res) => {
  res.status(200).json({ 
    status: 'healthy', 
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

// app.listen MUST always be the last line in the file:
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server listening on port ${PORT}`);
});