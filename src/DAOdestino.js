class DAOdestino {
  
    constructor(pool) {
      this.pool = pool;
    }
  
    // Obtener todos los destinos de la base de datos
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

    buscarDestinos(termino, callback) {
      this.pool.getConnection((err, connection) => {
        if (err) {
          console.log("Error al conectar a la base de datos", err);
          callback(err, null);
        } else {
          // Usar LIKE en SQL para buscar destinos que contengan el término de búsqueda
          connection.query("SELECT * FROM destinos WHERE nombre LIKE ?", ['%' + termino + '%'], (err, resultados) => {
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
    
    
  
  }
  
  module.exports = DAOdestino;
  