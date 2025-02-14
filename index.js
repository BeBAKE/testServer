const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 5500;

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  try {
    res.status(200).json({ msg: "hello world!" });
  } catch (error) {
    res.status(500).json({ msg: error });
  }
});
app.post("/", (req, res) => {
  try {
    console.log(req.body);
    const { name } = req.body;
    res.status(200).json({ msg: `hello ${name}` });
  } catch (error) {
    res.status(500).json({ msg: error });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port : ${PORT}`);
});
