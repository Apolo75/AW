class DAOdestino {
  
    constructor(pool) {
      this.pool = pool;
    }
  
    // Obtener todos los destinos
    obtenerTodosLosDestinos(callback) {
     
      this.pool.getConnection((err, connection) => {
        if (err) {
          console.log("Error al conectar a la base de datos", err);
          callback(err, null);
        } else {
          connection.query("SELECT * FROM destinos", (err, resultados) => {
            connection.release();
            if (err) {
              callback(err, null);
            } else {
              callback(null, resultados);
            }
          });
        }
      });
    }
  
    // Obtener un destino por su ID
    obtenerDestinoPorId(id, callback) {
      
      this.pool.getConnection((err, connection) => {
        if (err) {
          console.log("Error al conectar a la base de datos", err);
          callback(err, null);
        } else {
          console.log("ID:", id, "Tipo de dato:", typeof id);

          connection.query("SELECT * FROM destinos WHERE id = ?", [id], (err, resultados) => {
            connection.release();
            if (err) {
              callback(err, null);
            } else {
              callback(null, resultados[0] || null);
            }
          });
        }
      });
    }
    
  
  }
  
  module.exports = DAOdestino;
  