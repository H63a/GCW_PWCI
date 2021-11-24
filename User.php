<?php
//Toma los datos de javascript y los manda al archivo de LoginUser--------------------------------------------------------------------------
require_once 'LoginUser.php';
//instanciando la clase "user"----------------------------------------------------------------------------------------------------------------
$user = new User;

//recibe el json para convertirlo en un arreglo----------------------------------------------------------------------------------------------
//Aquí toma el form que se mando-----------------------------------------------------------------------------------------------------------
    $posteado= file_get_contents("php://input"); 

    //qaui los datos se convierten en codigo Json--------------------------------------------------------------------------------------------
    $datos = json_decode($posteado,true); 


    //Para que funcione el inico de sesion-------------------------------------------------------
    if($_POST['opc']==1){

//Arreglo que toma el usuario y contraseña-------------------------------------------------------
    $nickName = $_POST['username'];
    $contra = $_POST['contra'];
   
            $json = [
                  "username"=> $nickName,
                  "contra"=> $contra,
                  ];
//Convierte los datos a codigo json------------------------------------------------------------------------------------------------------
    $pasaAJson = json_encode($json); 

    $result = $user -> Login($pasaAJson);
    echo $result;
    }

     //Aqui se obtienen los datos del usuario----------------------------------------------------------------------------------------------------------
     if ($_POST['opc'] == 2) {

        $result = $user -> obtenerPerfilUsuario();
        echo json_encode($result);
    
    }


?>