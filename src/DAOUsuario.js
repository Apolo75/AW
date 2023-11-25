const consultaLeerUsuarioNombre = "SELECT * FROM usuarios WHERE nombre = ?";

class DAOUsuario {
  
  constructor(pool) {
    this.pool = pool;
  }
  
  getUserByName(name, callback) {

    this.pool.getConnection((err, connection) => {
      if (err) {
        console.log("Error al conectar a la base de datos", err);
        callback(err, null);
      } else {
        connection.query(consultaLeerUsuarioNombre, [name], (err, usuario) => {
          connection.release();
          if (err) callback(err, null);
          else {
            callback(null, usuario);
          }
        });
      }
    });
  }
  

}

module.exports = DAOUsuario;