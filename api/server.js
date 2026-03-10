const express = require("express");
const { Pool } = require("pg");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.json());
app.use(express.static("public"));

const pool = new Pool({
  user: "admin",
  host: "postgres",
  database: "rfid_db",
  password: "admin123",
  port: 5432
});

app.post("/usuarios", async (req, res) => {

  const { cedula, nombres, apellidos, cargo, tarjeta, area } = req.body;

  try {

    await pool.query(
      "INSERT INTO usuarios(cedula,nombres,apellidos,cargo,tarjeta,area_id) VALUES($1,$2,$3,$4,$5,$6)",
      [cedula, nombres, apellidos, cargo, tarjeta, area]
    );

    res.send("Usuario creado");

  } catch (err) {

    console.error(err);
    res.status(500).send("Error");

  }

});

app.listen(3000, () => {
  console.log("Servidor corriendo en puerto 3000");
});