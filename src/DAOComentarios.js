const sentInsertarComentario = "INSERT INTO comentarios (destino_id, nombre_usuario, comentario, fecha_comentario) VALUES (?, ?, ?, ?)";
const sentGetComentarios = "SELECT * FROM comentarios WHERE destino_id = ? ORDER BY fecha_comentario DESC";

class DAOComentarios {
  
  constructor(pool) {
    this.pool = pool;
  }

  insertComment(usuario_nombre, destino_id, comentario, callback) {
    
    this.pool.getConnection((err, connection) => {
      if (err) {
        console.log("Error al conectar a la base de datos", err);
        callback(err, null);
      } else {
        connection.query(sentInsertarComentario, [destino_id, usuario_nombre, comentario, new Date()], (err, resultado) => {
          connection.release();
          if (err) callback(err, null);
          else callback(null, resultado);
        });
      }
    });
  }


    getComentariosbyId(destino_id, callback) {
      this.pool.getConnection((err, connection) => {
        if (err) {
          console.log("Error al conectar a la base de datos", err);
          callback(err, null);
        } else {
          connection.query(sentGetComentarios, [destino_id], (err, rows) => {
            connection.release();
            if (err) callback(err, null);
            else callback(null, rows);
          });
        }
      });
    }
  
}

module.exports = DAOComentarios;