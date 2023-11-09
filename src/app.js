const mysql = require('mysql');
const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "viajes",
});

const express = require('express');
var path = require('path');

const DAOReserva = require('./DAOReserva.js');
const DAOdestino= require('./DAOdestino.js');

const destinosDAO = new DAOdestino(pool);
const reservaDAO = new DAOReserva(pool);

const app = express();

app.use(express.static('public')); //para coger la ruta de la imagen
app.use('/styles', express.static('styles'));
app.use(express.json()); 
app.use(express.urlencoded({ extended: true })); 

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.get('/', function(req, res, next){
  destinosDAO.obtenerTodosLosDestinos((err, destinos) => {
    if (err) next(err);
    else {
      //Procesa cada destino para convertir la cadena de 'imagen' en un array de 'imagenes'
      destinos.forEach(destino => {
        destino.imagenes = destino.imagen.split(','); // Suponiendo que 'imagen' es una cadena de rutas separadas por comas
        if(destino.imagenes.length > 0) destino.imagen = destino.imagenes[0];
      });

      // Si todo sale bien, renderiza la vista 'index.ejs' pasando los destinos ya procesados
      res.render('index', { destinos: destinos });
    }
  });
});

app.get('/detallesViaje/:id', function(req,res,next){
  var id = req.params.id;

  destinosDAO.obtenerDestinoPorId(id, (err, destino) => {
    if (err) next(err);
    else{
      //convertir la cadena de 'imagen' en un array de 'imagenes'
      destino.imagenes = destino.imagen.split(','); // Suponiendo que 'imagen' es una cadena de rutas separadas por comas
      res.render('detallesViaje',{ destino: destino });
    }
  });
});

app.post('/reservar', function(request, response, next) {
    var destino_id=request.body.destinoId;
    var nombre = request.body.nombreCliente;
    var correo = request.body.correoElectronico;
    var fecha =request.body.fechaReserva;

    reservaDAO.insertarReserva(destino_id, nombre, correo, fecha, (err, resultado) => {
      if(err) { 
        next(err);}
      else {
        response.render('estadoReserva', { reservaConfirmada : resultado });
      }
    })
});

//Manejador de errores
app.use((error, request, response, next) => {
    console.log(error); //Para debugear
    // Si hay un error, envía un código de estado 500 (Error Interno del Servidor)
    response.status(500);
    response.render('error', {msj_error: null});
});

//Último middleware, al que se llega si la página no se ha encontrado
app.use((request, response, next) => {
    //Estado 404, página no encontrada
    response.status(404);
    response.render('error', {msj_error: 'Página no encontrada'});
});

app.listen(3000, (err) => {
  if(err) (console.log("Error al iniciar el servidor"));
  else console.log("Servidor activo");
});
