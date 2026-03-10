SELECT 
u.cedula,
u.nombres,
u.apellidos,
p.nombre AS puerta,
a.fecha,
a.resultado
FROM accesos a
JOIN usuarios u ON a.usuario_id = u.id
JOIN puertas p ON a.puerta_id = p.id
ORDER BY a.fecha DESC;