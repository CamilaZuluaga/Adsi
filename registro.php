<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
	<title>Regístro</title>
	<link rel="stylesheet" href="assets/css/estRegi.css">
  <link rel="icon" type="image/png" href="assets/img/ico.png">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200;300;500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="title"><h1>¿Aún no te has registrado? Hazlo aquí</h1></div>
	<div class="seleccionar">
		<img class="avatar" src="assets/img/avatar.png" alt="Avatar">	
			
					<select class="select" name="#" id="#" onchange="cargarformulario(this.value)">
            <option >Selecciona qué tipo de usuario eres</option>
            <option value="1" required>Empresa</option>
            <option value="2" required>Cliente</option>
          </select>
        
	</div>
    <div id="cargar">                                               
    <!--- Aquí se carga todo --->
          </div>
</body>

<script>
            function cargarformulario(id){
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
               document.getElementById("cargar").innerHTML = this.responseText;
              }
           };

            xhttp.open("GET", "cargarRegistro.php?tipoR="+id, true);
            xhttp.send();

          }
        </script>
</html>