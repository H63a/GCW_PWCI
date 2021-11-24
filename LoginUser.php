<?php

require_once "Connection.php";

session_start(); 

class User extends conexion{


//funcion para iniciar sesion--------------------------------------------------------------------------------------------------------------
public function Login ($json){

        $datosPerfil = json_decode($json,true);
    
                $username = $datosPerfil ["username"];
                $contra = $datosPerfil ["contra"];
                
                //mandando a llamar el procedure del login ------------------------------------------------------------------------------------
                $query = "Call sp_Login( '$username','$contra');";
                //óbteniendo el usuario--------------------------------------------------------------------------------------------------------
                $datosPerfil  = parent::ObtenerUsuario($query); 
   
        return $datosPerfil;
    } 

//c se obtienen en la consola los datos respectivos del usuario (en este caso Id, nombre y alias)--------------------------------------------
    public function obtenerPerfilUsuario(){
        header('Content-Type: application/json');
        //aqui se asignan dichos datos------------------------------------------------------------------------------------------------------
        if(isset($_SESSION["idUsuario"])){
            $ID=$_SESSION["idUsuario"]; 
            $NickName=$_SESSION["nickName"];
            $Nombre=$_SESSION["nombre"];
           //se poonen en un arreglo para enviarlos----------------------------------------------------------------------------------------
       $json = [
            "ID" => $ID,
            "NickName" => $NickName,
            "Nombre" => $Nombre,
        ];
        return $json;
        }else{
            $success=0;
            return $success;
        }
    }


}