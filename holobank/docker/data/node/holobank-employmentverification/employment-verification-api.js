var express = require("express");
const fs = require('fs').promises;

var app = express();
app.use(express.json());
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

var port = process.env.PORT || 4005;

app.get("/", (req, res) => {
  res.send("Employment verification API is up and running!");
});

app.get("/v2", (req, res) => {
  res.send("v2");
});

app.get("/v2/home-loans", async (req, res) => {
  try {
    const term = req.query.term;
    const response = await getResponse('home-loans.json');

    if (term) {
      const filteredResponse = response.filter((loan) => loan.term >= term);
      res.send(filteredResponse);
    } else {
      res.send(response);
    }
    res.send(response);
  } catch (err) {
    console.error('Error:', err);
    res.status(500).send('Internal server error');
  }
});

app.listen(port, function () {
  console.log("Your app is listening on port " + port);
});

async function getResponse(filename) {
  try {
    const data = await fs.readFile(`endpoints/${filename}`, 'utf8');
    return JSON.parse(data);
  } catch (err) {
    console.error('Error reading file or parsing JSON:', err);
    throw err;
  }
}
