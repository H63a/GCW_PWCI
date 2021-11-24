<?php

    class conexion{
      private $server;
      private $user;
      private $password;
      private $database;
      private $port;
      public $conexion;

      function __construct(){

           $listadatos = $this->datosconexion();
           foreach($listadatos as $key => $value){
               $this->server = $value["server"];
               $this->user = $value["user"];
               $this->password = $value["password"];
               $this->database = $value["database"];
               $this->port = $value["port"];
               }

               $this->conexion = new mysqli($this->server,$this->user,$this->password,$this->database,$this->port);
               if($this->conexion->connect_errno){
                   echo "la conexion esta mal";
                   die();
               }
      }
      public function Error(){
       
        return $this->conexion->error;
       }

      private function datosconexion(){

        //Dirección donde está ubicada------------------------------------------------------------------------------
        $direccion = dirname(__FILE__); 

        //Manda al archivo config----------------------------------------------------------------------------------
        $jsondata = file_get_contents($direccion."/"."config"); 
        return json_decode($jsondata,true);
       }


    //obteniendo los datos mandados del queyr------------------------------------------------------------------------------
       public function obtenerDatos($query){
        $results = $this->conexion->query($query);
        $resultarray = array();
    
        foreach($results as $key){
          $resultarray[]= $key;
        }
        return $this->convertirUTF8($resultarray);
       }

       public function rowsAfectados($query){
        $this->conexion->query($query);
        return $this->conexion->affected_rows;
       }

       //obtiene al usuario-------------------------------------------------------------------------------------------
       public function ObtenerUsuario($query){
        $resultado = mysqli_query($this->conexion,$query);
        $row = mysqli_fetch_array($resultado); 

        //si se escribieron los datos del usuario--------------------------------------------------------------------
        if(isset($row["idUsuario"]) ){
          
          //asignacion de valores--------------------------------------------------------------------------------------
          $_SESSION["idUsuario"]=$row["idUsuario"];
          $_SESSION["nickName"]=$row["nickName"];
          $_SESSION["nombre"]=$row["nombre"];

          return 1;
        }
        else
        {

          return 0;
          
          }
       }

       private function convertirUTF8($array){
        array_walk_recursive($array,function(&$item,$key){
            if(!mb_detect_encoding($item,'utf-8',true)){
                $item = utf8_encode($item);
            }
        });
        return $array;
    }

    }

?>