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

//Sesiones
const session = require('express-session');
const mySQLSession = require('express-mysql-session');
const MYSQLStore = mySQLSession(session);
const sessionStore = new MYSQLStore({
  host: "localhost",
  user: "root",
  password: "",
  database: "viajes",
});

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

//Middleware sesiones
const middlewareSession = session({
  saveUninitialized: false,
  secret: 'evjnfheidf',
  resave: false,
  store: sessionStore,
});
app.use(middlewareSession);
app.use(function(request, response, next) {
  response.locals.user = request.session.user;
  next();
})

// Instanciamos los objetos DAO
const DAOReserva = require('./DAOReserva.js');
const DAOdestino = require('./DAOdestino.js');
const DAOUsuario = require('./DAOUsuario.js');
const DAOComentarios = require('./DAOComentarios.js');

const destinosDAO = new DAOdestino(pool);
const reservaDAO = new DAOReserva(pool);
const daoUsuario = new DAOUsuario(pool);
const comentariosDAO = new DAOComentarios(pool);

//peticiones:
app.get('/comentarios/:id', function(req, res, next) {
  const destinoId = req.params.id;

  comentariosDAO.getComentariosbyId(destinoId, (err, comentarios) => {
    if (err) {
      next(err);
    } else {
      res.json(comentarios);
    }
  });
});


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

app.post("/iniciarSesion", function(request, response, next) {

  daoUsuario.getUserByName(request.body.nombreUsuario, (err, resultado) => {
    if(err) {
      response.status(300); 
      next(err); 
    }

    let usuario = resultado[0];
    if(usuario === undefined) {
      response.status(300);
      response.render('error', {msj_error: "Usuario no encontrado", error_status: 300});
    }
    else if(usuario.contrasena !== request.body.contrasena) {
      response.status(300);
      response.render('error', {msj_error: "Contraseña incorrecta", error_status: 300});
    }
    else {
      response.status(200);
      request.session.user = usuario;
      response.locals.user = usuario;
      response.render('sesionIniciada', {user: usuario});
    }
  })
});

app.post("/registrar", function(request, response, next) {
  daoUsuario.getUserByName(request.body.nombreUsuario, (err, resultado) => {
    if(err) {
      response.status(500); 
      next(err); 
    }

    var regexNombre = /^[A-Za-zÀ-ÿ\s]+$/; // var RegEx no contiene números ni caracteres especiales
    var regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // var RegExtiene indica: ni espacios ni arrobas seguido de arroba seguido de ni espacios ni arrobas seguido de . de sin 
    var regexFecha = /^(0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[012])\/\d{4}$/;

    if (!regexNombre.test(request.body.nombreUsuario)) {
      var err = new Error('El formato del nombre no es correcto');
      response.status(300);
      return next(err);
    }
    if (!regexCorreo.test(request.body.correoUsuario)) {
      var err = new Error('El formato del correo no es correcto');
      response.status(300);
      return next(err);
    }

    if(resultado[0] !== undefined) {
      response.status(300);
      response.render('error', {msj_error: "Lo sentimos, el nombre de usuario ya está utilizado", error_status: 300});
    }
    else {
      daoUsuario.insertUser(request.body.nombreUsuario, request.body.correoUsuario, request.body.contrasena, (err, resultado) => {
        if(err) {
          response.status(500); 
          next(err); 
        } else {
          response.status(200);
          
          daoUsuario.getUserByName(request.body.nombreUsuario, (err, resultado) => {
            if(err) {
              response.status(500); 
              next(err); 
            } else {
              let usuario = resultado[0];

              //Iniciar sesión con el usuario registrado
              request.session.user = usuario;
              response.locals.user = usuario;
              response.render('usuarioRegistrado', {user: usuario});
            }
          })
        }
      })
    }
  })
});

app.get("/cerrarSesion", function(request, response, next) {
  request.session.destroy();
  response.locals.user = undefined;
  response.status(200);
  response.render('sesionCerrada');
});



app.post("/publicarComentario/:id", function(request, response, next) {
  console.log(request.body);
  comentariosDAO.insertComment(request.body.nom_usuario, request.params.id, request.body.comentario, (err, resultado) => {
    if(err) {
      response.status(300); 
      next(err); 
    } else {
      response.status(200);
      response.end();
    }
  })
})


// MIDDLEWARES 

// para manejar errores genéricos
app.use((error, req, res, next) => {
  // Log del error para depuración
  console.error("ha entrado en middleware generico de error");
  console.log(error.message);
  // Envía el estado del error y el mensaje a la plantilla de error
  res.status(error.status || 500).render('error', {
    msj_error: error.message || 'Ha ocurrido un error interno.',
    error_status: error.status || 500
  });
});

//Último middleware, al que se llega si la página no se ha encontrado
app.use((request, response, next) => {
  //Estado 404, página no encontrada
  response.status(404);
  response.render('error', {msj_error: 'Página no encontrada', error_status: 404});
});

// Iniciar el servidor ESCUCHANDO EN PUERTO 3000 
app.listen(3000, (err) => {
  if (err) (console.log("Error al iniciar el servidor"));
  else console.log("Servidor activo");
});
