const consultaLeerReservaID = "SELECT * FROM reservas WHERE id = ?";
const sentenciaInsertarReserva = "INSERT INTO reservas (destino_id, nombre_cliente, correo_cliente, fecha_reserva) VALUES (?, ?, ?, ?)";


class DAOReserva {
    constructor(pool) {
        this.pool = pool;
    }
    
    getReserva(id, callback) {
        this.pool.getConnection(function (err, connection) {
            if (err) console.log("Error al conectar a la base de datos");
            else {
                connection.query(consultaLeerReservaID, [id], function (err, filas) {
                    connection.release();
                    if (err) callback(err);
                    else callback(null, filas);
                });
            }
        });
    }

    insertarReserva(destino_id, nombre, correo, fecha_reserva, callback) {
        this.pool.getConnection(function (err, connection) {
            console.log ('he entrado en insertarreserva del dao')
            if (err) console.log("Error al conectar a la base de datos");
            else {
                connection.query(sentenciaInsertarReserva, [destino_id, nombre, correo, fecha_reserva], function (err, resultado) {
                    connection.release();
                    if (err) callback(err);
                    else callback(null, resultado);
                });
            }
        });
    }
}
module.exports = DAOReserva;