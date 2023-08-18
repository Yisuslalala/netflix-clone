const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

const PORT = 8080;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  user: "yisus",
  host: "localhost",
  password: "1235",
  database: "netflix_db",
});

app.get("/hello", (req, res) => {
  res.send("Hello from the backend");
});

app.get("/users", (req, res) => {
  db.query("SELECT * FROM users", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

app.get("/users/:id", (req, res) => {
  const user_id = req.params.id;
  db.query("SELECT * FROM users WHERE user_id = ?", user_id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

app.get("/films", (req, res) => {
  db.query("SELECT film_id, title, duration FROM films", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

app.get("/films/:id", (req, res) => {
  const film_id = req.params.id;
  db.query("SELECT * from films WHERE film_id = ?", film_id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

app.get("/users/:id/list", (req, res) => {
  const u_id = req.params.id;
  db.query(
    "SELECT * FROM films WHERE film_id in (SELECT f_id FROM lists WHERE u_id = ?)",
    u_id,
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});

app.get("/users/:id/reaction", (req, res) => {
  const u_id = req.params.id;
  db.query(
    "SELECT title, cover FROM films WHERE film_id in (SELECT f_id FROM reactions WHERE u_id = ?)",
    u_id,
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
