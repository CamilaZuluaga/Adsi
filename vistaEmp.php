<?php 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">   
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200;300;500&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/estVistaCli.css">
	<link rel="icon" type="image/png" href="assets/img/ico.png">
	<title>Empresa</title>
</head>
<body>
	<header class="hero">
		<nav>
			<a href="">Inicio</a>
			<a href="">Cerrar sesión</a>
		</nav>
		<section>
		<div class="textos-hero">
			<h1>¡Bienvenid@ !</h1>
			<p>Ofrece tus servicios como empresa</p>
			<a href="#con">Hazlo ya</a>
		</div>
		<div class="svg-hero" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%"><path d="M0.00,49.98 C149.99,150.00 349.20,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #f2f2f2;"></path></svg></div></header>
</section>

<div class="contenedor">
	
	<form class="form" method="POST" action="contro"	
l/controlEmpresa.php">
                <div class="uno">

                	
                	<input type="text" disabled value="<?php echo $_SESSION['usuario'] ?>">
					<input type="text"  value="<?php echo $_SESSION['id'] ?>"> 
                	
                    <p>Nombre Servicio</p>
                    <input type="text" name="nombServ" placeholder="Nombre Servicio">
                    <p>Descripcion</p>
                    <input type="text" name="descripcion" placeholder="Descripcion">
                    <p>Valor Servicio</p>
                    <input type="text" name="valor" placeholder="Valor Servicio">
                  
                    <input type="submit" name="registro" value="Regístrate">
                </div>
		    </form>
		    </div>

	</section>
	<div class="svg-wave" style="height: 100px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%"><path d="M0.00,49.98 C149.99,150.00 349.20,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #86C5DE;"></path></svg></div>

	<footer>
		<div class="container-footer">
			<div class="copyrigth">
				Dog Package | Maria camila Zuluaga | Dayhana Vélez
			</div>
			<img id="icono" src="img/icono.png" alt="icono empresa">
		</div>
	</footer>

</body>
</html>