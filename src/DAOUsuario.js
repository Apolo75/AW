const consultaLeerUsuarioNombre = "SELECT * FROM usuarios WHERE nombre = ?";
const sentInsertarUsuario = "INSERT INTO usuarios (nombre, correo, contrasena) VALUES (?, ?, ?) ";

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

  insertUser(nombre, correo, contraseña, callback) {
    this.pool.getConnection((err, connection) => {
      if (err) {
        console.log("Error al conectar a la base de datos", err);
        callback(err, null);
      } else {
        connection.query(sentInsertarUsuario, [nombre, correo, contraseña], (err, resultado) => {
          connection.release();
          if (err) callback(err, null);
          else callback(null, resultado);
        });
      }
    });
  }
}

module.exports = DAOUsuario;