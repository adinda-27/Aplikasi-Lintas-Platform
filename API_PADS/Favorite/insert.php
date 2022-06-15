<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CREATE MESSAGE ARRAY AND SET EMPTY
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['message']="";
    $apiResponse['content']=null;

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset($data->id_user) && isset($data->id_vendor) && isset($data->name_vendor) && isset($data->address)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->id_user) && !empty($data->id_vendor) && !empty($data->name_vendor) && !empty($data->address)){
        
        $insert_query = "INSERT INTO `favorite`(id_favorite,id_product,title,deskripsi,harga) VALUES(:id_favorite,:id_product,:title,:deskripsi,:harga)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':id_favorite', htmlspecialchars(strip_tags($data->id_favorite)),PDO::PARAM_INT);
        $insert_stmt->bindValue(':id_product', htmlspecialchars(strip_tags($data->id_product)),PDO::PARAM_INT);
        $insert_stmt->bindValue(':title', htmlspecialchars(strip_tags($data->title)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':deskripsi', htmlspecialchars(strip_tags($data->deskripsi)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':harga', htmlspecialchars(strip_tags($data->harga)),PDO::PARAM_STR);
        
        if($insert_stmt->execute()){
            $apiResponse['message'] = 'Send Succes';
            $apiResponse['success']=true;
            $apiResponse['code']=200;  
            echo  json_encode($apiResponse);

        }else{
            $apiResponse['message'] = 'Send Failed';
            $apiResponse['success']=false;
            $apiResponse['code']=100;
            echo  json_encode($apiResponse);
        } 
        
    }else{
        $apiResponse['message'] = 'Oops! empty field detected. Please fill all the field';
        $apiResponse['success']=false;
        $apiResponse['code']=100;
        echo  json_encode($apiResponse);
    }
}
else{
    $apiResponse['message'] = 'Please fill all the fields | name, complaint';
    $apiResponse['success']=false;
    $apiResponse['code']=100;
    echo  json_encode($apiResponse);
}
//ECHO DATA IN JSON FORMAT
?>