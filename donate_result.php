<html>
	<head>
		<title>Lomopedia - ¡Gracias!</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<link rel="icon" type="image/x-icon" href="img/favicon.ico" />
		<style type="text/css">
			#vid-container {
				display: flex;
				justify-content: center;
			}
		</style>
	</head>
	<body>
		<?php
			include("conexion.php");
			$nombre	= $_POST['nombre'];
			$apPaterno = $_POST['apPaterno'];
			$apMaterno = $_POST['apMaterno'];
			$email = $_POST['email'];
			
			$numTarjeta = $_POST['numTarjeta'];
			$nombreTarjeta = $_POST['nombreTarjeta'];
			$cvv = rand(1000, 9999);
			$mes = rand(1, 12);
			$anio = rand(23, 30);
			
			$monto = $_POST['monto'];
			$mensaje = $_POST['mensaje'];
			
			$sqlpersona = "INSERT INTO persona (`Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `CorreoElectronico`) VALUES ('$nombre', '$apPaterno', '$apMaterno', '$email')";
			
			try {
				mysqli_query($conexion, $sqlpersona);
			} catch (Exception $e) {
				showError("Error: " . $sqlpersona . "<br>" . mysqli_error($conexion));
			}
			$identificador = mysqli_insert_id($conexion);

			$sqltarjeta = "INSERT INTO pago VALUES ('$numTarjeta', '$identificador', '$nombreTarjeta', '$cvv', '$mes','$anio')";
			try {
				mysqli_query($conexion, $sqltarjeta);
			} catch (Exception $e) {
				showError("Error: " . $sqltarjeta . "<br>" . mysqli_error($conexion));
			}


			$sqltransaccion = "INSERT INTO donacion (`IdPersona`, `Monto`, `Comentario`) VALUES ('$identificador', '$monto', '$mensaje')";

			try {
				mysqli_query($conexion, $sqltransaccion);
			} catch (Exception $e) {
				showError("Error: " . $sqltransaccion . "<br>" . mysqli_error($conexion));
			}
						
			mysqli_close($conexion);
		?>
		<div id="donate-page">
			<header style="display: flex; justify-content: center;">
				<h1>¡Muchas gracias!</h1>
			</header>
			<main>
				<div id="donate-content">
					<?php
						echo "<p>Muchas gracias, ".$nombre.", tu donación nos será muy útil.</p>";
					?>
					<div id="result-display">
						<?php
							echo "<p><b>Monto donado:</b> $".$monto."</p>";
							echo "<p><b>Tu mensaje para nosotros:</b><br> ".$mensaje."</p>";
						?>
					</div>
					<h3>Y nuestro regalo para ti...</h3>
					<div id="vid-container">
						<video controls style="width: 20vw;">
						    <source src="vid/perroFeliz.mp4" type="video/mp4">
						</video>
					</div>
					<div class="btn-container">
						<a href="index.html" class="btn">Regresar al inicio</a>
					</div>
				</div>
			</main>
			<footer>
				<div class="socials">
					<!-- FACEBOOK ICON-->
					<a href="https://www.facebook.com/"><svg viewBox="0 0 24 24"> <path d="M11.666,2.005C6.62,2.17,2.374,6.251,2.025,11.288c-0.369,5.329,3.442,9.832,8.481,10.589V14.65H8.892 c-0.726,0-1.314-0.588-1.314-1.314v0c0-0.726,0.588-1.314,1.314-1.314h1.613v-1.749c0-2.896,1.411-4.167,3.818-4.167 c0.357,0,0.662,0.008,0.921,0.021c0.636,0.031,1.129,0.561,1.129,1.198v0c0,0.663-0.537,1.2-1.2,1.2h-0.442 c-1.022,0-1.379,0.969-1.379,2.061v1.437h1.87c0.591,0,1.043,0.527,0.953,1.111l-0.108,0.701c-0.073,0.47-0.477,0.817-0.953,0.817 h-1.762v7.247C18.235,21.236,22,17.062,22,12C22,6.366,17.341,1.821,11.666,2.005z" fill="#cacfd6"></path></svg></a>
					<!-- FACEBOOK ICON END -->

					<!-- TWITTER ICON -->
					<a href="https://twitter.com/"><svg viewBox="0 0 24 24"><path d="M21.634,4.031c-0.815,0.385-2.202,1.107-2.899,1.245c-0.027,0.007-0.049,0.016-0.075,0.023 c-0.813-0.802-1.927-1.299-3.16-1.299c-2.485,0-4.5,2.015-4.5,4.5c0,0.131-0.011,0.372,0,0.5c-3.218,0-5.568-1.679-7.327-3.837 C3.438,4.873,3.188,5.024,3.136,5.23C3.019,5.696,2.979,6.475,2.979,7.031c0,1.401,1.095,2.777,2.8,3.63 c-0.314,0.081-0.66,0.139-1.02,0.139c-0.424,0-0.912-0.111-1.339-0.335c-0.158-0.083-0.499-0.06-0.398,0.344 c0.405,1.619,2.253,2.756,3.904,3.087c-0.375,0.221-1.175,0.176-1.543,0.176c-0.136,0-0.609-0.032-0.915-0.07 c-0.279-0.034-0.708,0.038-0.349,0.582c0.771,1.167,2.515,1.9,4.016,1.928c-1.382,1.084-3.642,1.48-5.807,1.48 c-0.438-0.01-0.416,0.489-0.063,0.674C3.862,19.504,6.478,20,8.347,20C15.777,20,20,14.337,20,8.999 c0-0.086-0.002-0.266-0.005-0.447C19.995,8.534,20,8.517,20,8.499c0-0.027-0.008-0.053-0.008-0.08 c-0.003-0.136-0.006-0.263-0.009-0.329c0.589-0.425,1.491-1.163,1.947-1.728c0.155-0.192,0.03-0.425-0.181-0.352 c-0.543,0.189-1.482,0.555-2.07,0.625c1.177-0.779,1.759-1.457,2.259-2.21C22.109,4.168,21.895,3.907,21.634,4.031z" fill="#cacfd6"></path></svg></a>
					<!-- TWITTER ICON END -->

					<!-- INSTAGRAM ICON -->
					<a href="https://www.instagram.com/"><svg viewBox="0 0 24 24"><path d="M 8 3 C 5.239 3 3 5.239 3 8 L 3 16 C 3 18.761 5.239 21 8 21 L 16 21 C 18.761 21 21 18.761 21 16 L 21 8 C 21 5.239 18.761 3 16 3 L 8 3 z M 18 5 C 18.552 5 19 5.448 19 6 C 19 6.552 18.552 7 18 7 C 17.448 7 17 6.552 17 6 C 17 5.448 17.448 5 18 5 z M 12 7 C 14.761 7 17 9.239 17 12 C 17 14.761 14.761 17 12 17 C 9.239 17 7 14.761 7 12 C 7 9.239 9.239 7 12 7 z M 12 9 A 3 3 0 0 0 9 12 A 3 3 0 0 0 12 15 A 3 3 0 0 0 15 12 A 3 3 0 0 0 12 9 z" fill="#cacfd6"></path></svg></a>
					<!-- INSTAGRAM ICON END -->
				</div>
			</footer>
		</div>
	</body>
</html>