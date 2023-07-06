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

var port = process.env.PORT || 4004;

app.get("/", (req, res) => {
  res.send("Credit check API is up and running!");
});

app.get("/v1", (req, res) => {
  res.send("v1");
});

app.get("/v1/credit/score", async (req, res) => {
try {
  const tfn = req.query.tfn;
  const score = Math.ceil(Math.random() * (799 - 740) + 740);
  const response = `{"score": ${score}, "tfn": ${tfn}}`;
  res.send(response);
} catch (err) {
    console.error('Error:', err);
    res.status(500).send('Internal server error');
  }
});

app.post("/v1/credit/approval", async (req, res) => {
  try {
    const response = await getResponse('approval.json');
    res.send(response);
  } catch (err) {
    console.error('Error:', err);
    res.status(500).send('Internal server error');
  }
});

app.post("/v1/credit/fraud-detection", async (req, res) => {
  try {
    const response = await getResponse('fraud-detection.json');
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
