$(document).ready(function() {

    var JSONCargarComentarios = {
        url: '/comentarios/' + destinoId,
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
    };

    $.ajax(JSONCargarComentarios);

    $("#formComentario").on("submit", function(e) {
        e.preventDefault();

        $.ajax({
            url: '/publicarComentario/' + destinoId,
            type: 'POST',
            data: {
                comentario: $("#textAreaComentario").val(),
                nom_usuario: $("#nomUsuario").val()
            },
            success: function() {
                $.ajax(JSONCargarComentarios);
                $("#textAreaComentario").val("");

            },
            error: function() {
                alert($("#textAreaComentario").text());
                //alert('Error al publicar el comentario, por favor, vuelva a intentarlo más tarde.');
            }
        })
    });
});