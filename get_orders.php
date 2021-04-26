<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

try{
    $db = openDb();
    selectAsJson($db,"SELECT * FROM tilaus");
   
    
}catch(PDOException $e){
    returnError($pdoex);
}