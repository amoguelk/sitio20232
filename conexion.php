<?php

function showError($errormsg) {
  echo "<div id='php-error-page'>$errormsg</div>";
  exit();
}

//declarando variables para conexión
$servidor 	= "localhost";
$usuario	= "root";
$contra		= "root1234";
$BD			= "Eq11Lomopedia";

//Creando la conexión
try {
	$conexion = mysqli_connect($servidor, $usuario, $contra, $BD);	
} catch (Exception $e) {
	showError("Falló la conexión <br>".mysqli_connect_error());
}

?>