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
    $cod = $data->codigo;
    if(strlen($cod) < 1 or strlen($cod) > 8){
        echo json_encode(["success"=>0]);
        exit();
    }
    $nombre = $data->nombre;
    if(strlen($nombre) < 1 or strlen($nombre) > 50){
        echo json_encode(["success"=>1]);
        exit();
    }
    $precio = $data->precio;
    if($precio < 1 or $precio > 999999){
        echo json_encode(["success"=>2]);
        exit();
    }
    $stock = $data->stock;
    if($stock < 1 or $stock > 99999){
        echo json_encode(["success"=>3]);
        exit();
    }
    $estado = $data->estado;
    if(strlen($estado) < 1 or strlen($estado) > 15){
        echo json_encode(["success"=>4]);
        exit();
    }
    $sql = "SELECT * FROM medicamentos where nombre = '$nombre'";
    $query = $conexion -> query($sql);
    if($query->rowCount()){
        echo json_encode(["success"=>5]);
        exit();
    }else{
        $sql = "INSERT INTO medicamentos (codmedicamento, nombre, precio,stock,estado) VALUES ('$cod','$nombre', $precio,$stock,'$estado')";
        $query = $conexion -> query($sql);
        echo json_encode(["success"=>6]);
        exit();
    }
}
if(isset($_GET["agregar"])){
    CrearProducto();
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
                    'estado' => $row['estado'],
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
    function ListarDetalle($id){
        include_once 'db.php';
        $objeto = new Conexion();
        $conexion = $objeto->Conectar();
        $productos = array();
        $sql = "SELECT * FROM medicamentos WHERE codmedicamento ='$id'";
        $query = $conexion -> query($sql);
        if($query->rowCount()){
            while($row = $query-> fetch(PDO::FETCH_ASSOC)){
                $item = array(
                    'id' => $row['codmedicamento'],
                    'nombre' => $row['nombre'],
                    'precio' => $row['precio'],
                    'stock' => $row['stock'],
                    'estado' => $row['estado'],
                );
                array_push($productos, $item);
            }
            echo json_encode($productos);
            exit();
            
        }else{  
            echo json_encode(["success"=>0]);
        }
    }
    if(isset($_GET["consultar"])){
        $id = $_GET["consultar"];
        ListarDetalle($id);
    }
    Function BorradoLogico(){
        include_once 'db.php';
        $objeto = new Conexion();
        $conexion = $objeto->Conectar();
        $data = json_decode(file_get_contents("php://input"));
        $cod = $data->codigo;
        $sql = "UPDATE medicamentos set estado = 'No Disponible' where codmedicamento = '$cod' ";
        $query = $conexion -> query($sql);
        if(!$query->rowCount()){
            echo json_encode(["success"=>0]);
        }else{
            echo json_encode(["success"=>1]);
            exit();
        }
    }
    if(isset($_GET["eliminar"])){
        BorradoLogico();
    }
?>