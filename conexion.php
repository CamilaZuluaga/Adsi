<?php
class Conexion {
   public function conectar(){
    return new mysqli("localhost","root","","dogpackage",3306); 
    }
}