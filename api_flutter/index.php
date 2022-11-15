<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

function CrearProducto(){
    include_once 'db.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();
    $data = json_decode(file_get_contents("php://input"));
    $nombre = $data->nombre;
    $stock = $data->stock;
    $imagen = $data->imagen;
    $estado = $data->estado;
    $sql = "SELECT * FROM productos where nombre_producto = '$nombre'";
    $query = $conexion -> query($sql);
    if($query->rowCount()){
        echo json_encode(["success"=>0]);
    }else{
        $sql = "INSERT INTO productos (nombre_producto, stock_producto, stock_critico_producto, precio_producto, imagen_producto, estado_producto) VALUES ('$nombre', $stock, $stock_critico, $precio, '$imagen', '$estado')";
        $query = $conexion -> query($sql);
        echo json_encode(["success"=>1]);
        exit();
    }
}
if(isset($_GET["agregar"])){
    ObtenerProductos();
}

function ListarProductos(){
    include_once 'db.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();
    $productos = array();
    $query = $conexion -> query('SELECT * FROM medicamentos');
        if($query->rowCount()){
            while($row = $query-> fetch(PDO::FETCH_ASSOC)){
                $item = array(
                    'id' => $row['id_producto'],
                    'nombre' => $row['nombre_producto'],
                    'stock' => $row['stock_producto'],
                    'stock_critico' => $row['stock_critico_producto'],
                    'precio' => $row['precio_producto'],
                    'imagen' => $row['imagen_producto'],
                    'estado' => $row['estado_producto']
                );
                array_push($productos, $item);
            }
            
            echo json_encode($productos);
        }else{
            echo json_encode(array('mensaje'=>'no hay elementos'));
        }
    }
    function ListarProductos1(){
        include_once 'db.php';
        $objeto = new Conexion();
        $conexion = $objeto->Conectar();
        $productos = array();
        $query = $conexion -> query('SELECT * FROM medicamentos');
        if($query->rowCount()){
            while($row = $query-> fetch(PDO::FETCH_ASSOC)){
                $item = array(
                    'id' => $row['codmedicamento'],
                    'nombre' => $row['nombre'],
                    'precio' => $row['precio'],
                    'stock' => $row['stock'],
                );
                array_push($productos, $item);
            }
        
            echo json_encode($productos);
        }else{
            echo json_encode(array('mensaje'=>'no hay elementos'));
        }
    }
    if(isset($_GET["listar"])){
        ListarProductos1();
    }
?>