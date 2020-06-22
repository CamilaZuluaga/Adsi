<?php

function guardarCliente(){
    include("conexion.php");

    if(ISSET($_POST['registro'])){
        if(strlen ($_POST['doc']) >=1 && 
            strlen ($_POST['nombre']) >=1 && 
            strlen ($_POST['apellido']) >=1 &&  
            strlen ($_POST['edad']) >=1 && 
            strlen ($_POST['tel']) >=1  && 
            strlen ($_POST['email'] ) >=1 && 
            strlen ($_POST['contrasenia']) >=1 ){
        
            $documento = $_POST['doc'];
            $nombreUsuario = $_POST['nombre'];
            $apellidoUsuario = $_POST['apellido'];
            $edad = $_POST['edad'];
            $telefono = $_POST['tel'];
            $email = $_POST['email'];
            $clave = $_POST['contrasenia'];
            $mesaje = "";



        if ($mensaje == "") {
            $con = new Conexion();
            $consulta = $con->conectar();
            $consulta->set_charset("utf8");
            $sql = "INSERT INTO usuario( `idtipo_usuario`, `documento`, `nombreUsuario`, `apellidoUsuario`, `edad`, `telefono`, `email`, `contrasenia`) VALUES ('2','$documento','$nombreUsuario','$apellidoUsuario','$edad','$telefono','$email','$clave')";

       if ($consulta->query($sql) == 1) {
                session_start();
                $_SESSION["logueado"] = TRUE;
                $_SESSION["nombre"] = $nombreUsuario;
                $_SESSION["apellido"] = $apellidoUsuario;
                header("location:../index.php");
            

            } else{
                session_start();
                $mensaje = "Ya existe un usuario con el mismo " . $_SESSION["email"];
                header("location:index.php?error=1.php");
                echo $consulta;
            }
        }
    }
}
}