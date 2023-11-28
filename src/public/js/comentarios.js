$(document).ready(function() {
    var id = destinoId; // Reemplaza esto con el ID apropiado

    $.ajax({
        url: '/comentarios/' + id,
        type: 'GET',
        success: function(comentarios) {
            var contenido = '';
            comentarios.forEach(function(comentario) {
                contenido += '<div class="card mb-3">' +
                                '<div class="card-body">' +
                                    '<h5 class="card-title">' + comentario.nombre_usuario + '</h5>' +
                                    '<h6 class="card-subtitle mb-2 text-muted">' + comentario.fecha_comentario + '</h6>' +
                                    '<p class="card-text">' + comentario.comentario + '</p>' +
                                '</div>' +
                             '</div>';
            });
            $('#comentarios-container').html(contenido);
        },
        error: function() {
            alert('Error al cargar los comentarios');
        }
    });
});

