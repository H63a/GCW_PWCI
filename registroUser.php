<input type="file" id="file" name="file" multiple>

<?php

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname =  "bdm";

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if(!$conn){
    die("No hay conexion:  ".mysqli_connect_error());
}

$nombre = $_POST["txtusuario"];
$pass = $_POST["txtpassword"];

$query = "Call sp_Login( '$nombre','$pass');";
$nr = mysqli_num_rows($query);

if($nr == 1){
//headrer ("Location:pagina.html")
echo "Bienvenido '$nombre'  ";

echo' ';


}
else if ($nr == 0)
{
    echo "No ingreso";
}