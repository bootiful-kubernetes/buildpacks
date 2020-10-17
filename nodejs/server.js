const express = require('express');
const port = process.env.PORT || 8080;

const app = express();

app.get('/', (request, response) => {
  response.send( {'greetings' : 'Hello, Node.js!' });
});

app.listen(port);
