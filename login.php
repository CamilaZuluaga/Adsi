<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="assets/css/estLogin.css">
</head>
<body>
	<div class="login-box">
		<img class="avatar" src="assets/img/avatar.png" alt="">
			<h1>Inicie aquí</h1>
				<form id="formLogin" method="POST">
					<p>Correo Electrónico</p>
					<input type="text" name="usuario" placeholder="Email">
					<p>Contraseña</p>
					<input type="password" name="clave" placeholder="Contraseña">
					<input type="submit" name="submit" value="login" onclick="loginUser()">

				</form>
	</div>
	
</body>
</html>