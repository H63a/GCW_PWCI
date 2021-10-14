<?php
//obtener valores pasados del form  de login
$username = $POST['username'];
$password = $POST['password'];


//to prevent mysql injection
$username = stripcslashes($username);
$password = stripcslashes($password);

$username = mysql_real_escape_string($username);
$password = mysql_real_escape_string($username);
//conectar al servidor y seleccionar base de datos

mysql_connect("localhost","root","");
mysql_select_db("login");

// query the database for user
$result = mysql_query("select * from users where username = '$username' and password = '$password'")
    or die("Failed to query database".mysql_error());
$row = mysql_fetch_array($result);
if ($row['username'] == $username && $row['password'] == $password){
    echo "Login success!!!  Welcome ".$row['password'];
} else {
    echo "Failed to login";
}



?>