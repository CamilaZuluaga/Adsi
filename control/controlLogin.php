    <?php
    include('conexion.php');
    $con = new Conexion();
    $consulta = $con->conectar();
    $consulta->set_charset("utf8");
    $usu = $_POST['usuario'];
    $cla = $_POST['clave'];
    # Lógica del control:
    if (isset($_POST['usuario']) and isset($_POST['clave'])) {
                $sql="SELECT * from usuario where email ='$usu' and contrasenia = '$cla';";
                $exe = $consulta->query($sql);
                $if = $exe->num_rows;
                if ($if > 0) {
                        $_SESSION['id']= $res[0];
                        $_SESSION['usuario']= $res[2];
                        $_SESSION['perfil']= $res[1];
                        $_SESSION['correo']= $res[3];
                        if ($_SESSION['perfil']=1) {
                               header("location:../index.php");
                        }elseif ($_SESSION['perfil']=2){
                            header("location:../index.php");}
                }else{
                    header("location:../login.php");}
    }else{
        header("location:../login.php");}
?>