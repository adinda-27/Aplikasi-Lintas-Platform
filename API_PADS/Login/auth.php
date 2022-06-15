<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CHECKING, IF ID AVAILABLE ON $data
if(isset($data->email) && isset($data->password)){
    
    $apiResponse['success'] = false;
    $apiResponse['code'] = 200;
    $apiResponse['messages'] = "";
    $apiResponse['content'] = null;
    $email = $data->email;
    $password = $data->password;
 
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `user` WHERE email=:email and password=:password ";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':email', $email,PDO::PARAM_STR);
    $get_stmt->bindValue(':password', $password,PDO::PARAM_STR);
    $get_stmt->execute();
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){

            while($row = $get_stmt->fetch(PDO::FETCH_ASSOC)){
                $post_data = [
            'id' => $row['id'],
            'email' => $row['email'],
            'password' => $row['password'],
                 ];
        
        }
        $apiResponse['success'] = true;
            $apiResponse['message'] = 'User Logged';
            $apiResponse['content']=$post_data;
            echo json_encode($apiResponse);
    }
    else{
        $apiResponse['success'] = false;
            $apiResponse['message'] = 'Invalid email and password';
            echo  json_encode($apiResponse);
    }  
    
}
?>