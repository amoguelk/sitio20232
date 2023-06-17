<?php

//declarando variables para conexión
$servidor 	= "localhost";
$usuario	= "root";
$contra		= "root1234";
$BD			= "lomopedia";

//Creando la conexión
$conexion = mysqli_connect($servidor, $usuario, $contra, $BD);

//Verificando la conexion
if(!$conexion){
	echo "Falló la conexión <br>";
	die("Connection failed: " . mysqli_connect_error());
}
else{
	echo "Conexion exitosa";
}

?>