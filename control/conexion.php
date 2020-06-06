<?php
class Conexion {
   public function conectar(){
    return new mysqli("localhost","root","","bddogpackage",3306); 
    }
}