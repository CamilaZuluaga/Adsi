<?php 
    if ($_GET['tipoR']==1) { 
    	?>
        <div class="Registro-box">
            <form class="form" method="POST" action="control/controlEmpresa.php">
                <div class="uno">
                    <p>Nombre Empresa</p>
                    <input type="text" name="nombEmp" placeholder="Nombre Empresa">
                    <p>Nombre Proveedor</p>
                    <input type="text" name="nombre" placeholder="Nombre Proveedor">
                    <p>Correo Electrónico</p>
                    <input type="text" name="email" placeholder="Email">
                     <p>Contraseña</p>
                    <input type="password" name="contrasenia" placeholder="Contraseña">  
                </div>
                <div class="dos">
                     <p>Documento Proveedor</p>
                    <input type="text" name="doc" placeholder="Documento">
                    <p>Apellido Proveedor</p>
                    <input type="text" name="apellido" placeholder="Apellido ">
                    <p>Teléfono Proveedor</p>
                    <input type="tel" name="tel" placeholder="Teléfono">

                    <input type="submit" name="registro" value="Regístrate">
                </div>
		    </form>

   <?php }elseif ($_GET['tipoR']==2) { ?>
    <div class="Registro-box">
    	 <form class="form" method="POST" action="control/controlUsuario.php">
     		<div class="uno">
				<p>Nombre</p>
    			<input type="text" name="nombre" placeholder="Nombre">
    			<p>Documento</p>
    			<input type="text" name="doc" placeholder="Documento">
    			<p>Correo Electrónico</p>
				<input type="text" name="email" placeholder="Email">
				<p>Teléfono</p>
    			<input type="tel" name="tel" placeholder="Teléfono">
			</div>
    		<div class="dos">
    			<p>Apellido</p>
    			<input type="text" name="apellido" placeholder="Apellido">
    			<p>Edad</p>
    			<input type="number" name="edad" placeholder="Edad">
				<p>Contraseña</p>
				<input type="password" name="contrasenia" placeholder="Contraseña">
				<input type="submit" name="registro" value="Regístrate">
			</div>

		</form>
	</div> 		
  <?php }else{ ?>

  <?php } ?>