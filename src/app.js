 //PRACTICA VOLUNTARIA: ENTREGA 2 ALUMNOS: IVAN PISONERO DIAZ Y ENRIQUE MARTINEZ SANCHEZ GRUPO: 44
// Crear un pool de conexiones a la base de datos
const mysql = require('mysql');
const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "viajes",
});

// instancia de Express
const express = require('express');
const app = express();

// EJS como motor de plantillas en path views
var path = require('path');
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Configurar la carpeta pública para archivos estáticos
app.use(express.static('public')); //para coger la ruta de la imagen
app.use('/styles', express.static('styles'));

// Importar y configurar middleware para analizar cuerpos de solicitud JSON y de formulario
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Instanciamos los objetos DAO
const DAOReserva = require('./DAOReserva.js');
const DAOdestino = require('./DAOdestino.js');
const destinosDAO = new DAOdestino(pool);
const reservaDAO = new DAOReserva(pool);

// RUTAS:

app.get('/', function (req, res, next) {
  destinosDAO.obtenerTodosLosDestinos((err, destinos) => {
    if (err) next(err);
    else {
      //Procesa cada destino para convertir la cadena de 'imagen' en un array de 'imagenes'
      destinos.forEach(destino => {
        destino.imagenes = destino.imagen.split(','); // Suponiendo que 'imagen' es una cadena de rutas separadas por comas
        if (destino.imagenes.length > 0) destino.imagen = destino.imagenes[0];
      });

      // Si todo sale bien, renderiza la vista 'index.ejs' pasando los destinos ya procesados
      res.render('index', { destinos: destinos });
    }
  });
});

app.get('/detallesViaje/:id', function (req, res, next) {
  var id = req.params.id;

  destinosDAO.obtenerDestinoPorId(id, (err, destino) => {
    if (err) next(err);
    else if (!destino) {
      var error = new Error('Página no encontrada');
      error.status = 404;
      next(error);
    }
    else {
      //convertir la cadena de 'imagen' en un array de 'imagenes'
      destino.imagenes = destino.imagen.split(','); // Suponiendo que 'imagen' es una cadena de rutas separadas por comas
      res.render('detallesViaje', { destino: destino });
    }
  });
});

app.post('/reservar', function (request, response, next) {
  var destino_id = request.body.destinoId;
  var nombre = request.body.nombreCliente;
  var correo = request.body.correoElectronico;
  var fecha = request.body.fechaReserva;

  var regexNombre = /^[A-Za-zÀ-ÿ\s]+$/; // var RegEx no contiene números ni caracteres especiales
  var regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // var RegExtiene indica: ni espacios ni arrobas seguido de arroba seguido de ni espacios ni arrobas seguido de . de sin 
  var regexFecha = /^(0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[012])\/\d{4}$/;
  if (!regexNombre.test(nombre)) {
    var err = new Error('El formato del nombre del formulario no es correcto');
    err.status = 400; 
    return next(err);
  }
  if (!regexCorreo.test(correo)) {
    var err = new Error('El formato del correo del formulario no es correcto');
    err.status = 400; 
    return next(err);
  }
  /*
  if (!regexFecha.test(fecha)) {
    var err = new Error('El formato de la fecha no es correcto (debe ser dd/mm/aaaa)');
    err.status = 400; 
    return next(err);
  }*/

  reservaDAO.insertarReserva(destino_id, nombre, correo, fecha, (err, resultado) => {
    if (err) {
      next(err);
    }
    else {
      response.render('estadoReserva', { reservaConfirmada: resultado });
    }
  })
});

// MIDDLEWARES 

// para manejar errores genéricos
app.use((error, req, res, next) => {
  // Log del error para depuración
  console.error("ha entrado en middleware generico de error");
  // Envía el estado del error y el mensaje a la plantilla de error
  res.status(error.status || 500).render('error', {
    msj_error: error.message || 'Ha ocurrido un error interno.',
    error_status: error.status || 500
  });
});

// Iniciar el servidor ESCUCHANDO EN PUERTO 3000 
app.listen(3000, (err) => {
  if (err) (console.log("Error al iniciar el servidor"));
  else console.log("Servidor activo");
});
