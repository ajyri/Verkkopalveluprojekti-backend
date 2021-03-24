<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

try
{
    $id = $_GET['trnro'];
    $db = openDb();
    selectAsJson($db,"SELECT * FROM tuote where trnro = $id");
}
catch(PDOException $pdoex){
    returnError($pdoex);
}