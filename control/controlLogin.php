<?php
    include('conexion.php');
    $con = new Conexion();
    $consulta = $con->conectar();
    $consulta->set_charset("utf8");
    $resultado=$consulta->query("SELECT * FROM usuario");

    # Capturamos los datos del formulario:
    $usu = $_POST['usuario'];
    $cla = $_POST['clave'];

    # Lógica del control:
    $sql = "SELECT idtipo_usuario, email, contrasenia FROM  usuario  email = '.$usu.' AND contrasenia = '.$cla.' ";
    $exe = $con->sql($sql);
    if ($exe->num_rows > 0) {

        # Si el resultado es mayor a 0
        while($res = $exe->fetch_row()){
            session_start();
            $_SESSION['usuario']= $res[0];
            $_SESSION['perfil']= $res[1];
            $_SESSION['correo']= $res[2];
            
            switch ($_SESSION['perfil']) {
                case '1':
                    echo "1";
                    break;
                
                default:
                    echo "2";
                    break;
            }

        }
    }

?>