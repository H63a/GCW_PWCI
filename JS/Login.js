//Accediendo al formulario del login--------------------------------------------------------------------------------------------------
const formularioLogin = document.getElementById('formIniSesion'); 
//Accediendo a todos los inputs del login-------------------------------------------------------------------------------------------------
const inputs = document.querySelectorAll('#formIniSesion input'); 

//aqui se toma el evento del boton "submit"---------------------------------------------------------------------------------------------------
formularioLogin.addEventListener("submit", e => {

    //tomando los datos de los inputs dependiendo del id--------------------------------------------------------------------------------------
    var username = document.getElementById('inputUser').value;
    var contra = document.getElementById('inputPass').value;

    var opc = 2;

    e.preventDefault();

//tomando el form de html-------------------------------------------------------------------------------------------------------------------------
    var DatosDelForm = new FormData(); 

//adjuntando el usuario, contraseña y la opcion-----------------------------------------------------------------------------------------------------
    DatosDelForm.append('username', username);

    DatosDelForm.append('contra', contra);
    
    DatosDelForm.append('opc', 1);

    //Función asincrona, manda los datos a l archivo de User.php---------------------------------------------------------------------------------
    fetch('php/User.php', { method: "POST", body: DatosDelForm }) 
        .then(response => {
            //Retorna un dato tipo texto--------------------------------------------------------------------------------------------------------
            return response.text(); 
        })
        .then(data => {
            if(data==1){
                 alert("Bienvenido");
                 window.location.href="uploadVideoPage.html";  
            }
            else{
                alert("Los datos no son correctos, favor de intentarlo de nuevo");
            }
           
          //Imprimir/mostrar el texto mandado------------------------------------------------------------------------------------------------------
            console.log(data); 
         

        })
   
});