const sentInsertarComentario = "INSERT INTO comentarios (destino_id, nombre_usuario, comentario, fecha_comentario) VALUES (?, ?, ?, ?)";

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
        connection.query(sentInsertarComentario, [destino_id, usuario_nombre, comentario, "27/11/2023"], (err, resultado) => {
          connection.release();
          if (err) callback(err, null);
          else callback(null, resultado);
        });
      }
    });
  }
}

module.exports = DAOComentarios;