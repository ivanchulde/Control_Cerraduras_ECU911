const express = require("express");
const { Pool } = require("pg");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.json());
app.use(express.static("public"));
app.use(express.json());

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
app.post("/validar-tarjeta", async (req, res) => {

  const { tarjeta, puerta } = req.body;

  console.log("Tarjeta:", tarjeta);
  console.log("Puerta:", puerta);

  try {

    const resultado = await pool.query(
      "SELECT * FROM usuarios WHERE tarjeta = $1 AND estado = true",
      [tarjeta]
    );

    if(resultado.rows.length > 0){

      const usuario = resultado.rows[0];

      const permiso = await pool.query(
        "SELECT * FROM permisos_area_puerta WHERE area_id = $1 AND puerta_id = $2",
        [usuario.area_id, puerta]
      );

      if(permiso.rows.length > 0){

        await pool.query(
          "INSERT INTO accesos (usuario_id, puerta_id, resultado) VALUES ($1,$2,$3)",
          [usuario.id, puerta, true]
        );

        res.json({ acceso: true });

      }else{

        await pool.query(
          "INSERT INTO accesos (usuario_id, puerta_id, resultado) VALUES ($1,$2,$3)",
          [usuario.id, puerta, false]
        );

        res.json({ acceso: false });

      }

    }else{

      await pool.query(
        "INSERT INTO accesos (usuario_id, puerta_id, resultado) VALUES ($1,$2,$3)",
        [null, puerta, false]
      );

      res.json({ acceso: false });

    }

  } catch(error){

    console.error(error);
    res.status(500).send("Error servidor");

  }

});

app.listen(3000, () => {
  console.log("Servidor corriendo en puerto 3000");
});