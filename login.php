<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="assets/css/estLogin.css">
	<link rel="icon" type="image/png" href="assets/img/ico.png">
</head>
<body>
	<div class="login-box">
		<img class="avatar" src="assets/img/avatar.png" alt="">
			<h1>Inicie aquí</h1>
				<form id="formLogin" method="POST" action="control/controlLogin.php">
					<p>Correo Electrónico</p>
					<input type="email" name="usuario" placeholder="Email">
					<p>Contraseña</p>
					<input type="password" name="clave" placeholder="Contraseña">
					<input type="submit" name="submit" value="login">

				</form>
	</div>
	
</body>
</html>