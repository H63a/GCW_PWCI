

//Aqui accedemos al formulario por medio de su Id-------------------------------------------------------------------------------------
const formularioVideo = document.getElementById('formVideo'); 

var idUsuario;
$(document).ready(function () {

    MostrarDatosUsuario() ;

});

function MostrarDatosUsuario() {
    //form del html-----------------------------------------------------------------------------------------------------------------------------------
    var DatosDelForm = new FormData(); 
    DatosDelForm.append('opc', 2);
//Función asincrona, que manda los datos al archivo de  User.php-------------------------------------------------------------------------------------
    fetch('php/User.php', { method: "POST", body: DatosDelForm }) 
        .then(response => {
            //Retorna el tipo de dato "texto"--------------------------------------------------------------------------------------------------------
            return response.text(); 
        })
        .then(data => {
            //Imprimir/mostrar el texto mandado (con los datos del usuario)------------------------------------------------------------------------------------------------------
            console.log(data); 
            var JSon = data;
            var obj = JSON.parse(JSon);
            idUsuario = obj['ID'];

            document.getElementById('user').value = idUsuario;
        });


}



