<?php

class Conexion{
    public static function Conectar(){
        define('servidor','localhost');
        define('nombre_db','api_flutter');
        define('usuario','root');
        define('password', '');

            try{
                $conexion = new PDO('mysql:host='.servidor.'; dbname='.nombre_db, usuario, password);
                return $conexion;
            }catch(Exception $e){
                die('El error de conexion es: '.$e->getMessage());
            }

        
    }
}

?>