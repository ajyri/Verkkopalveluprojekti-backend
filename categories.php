<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

try
{
    if(isset($_GET['trnro'])){
        $id = $_GET['trnro'];
        $db = openDb();
        selectAsJson($db,"SELECT * FROM tuote where trnro = $id");
    }

    if(isset($_GET['trnimi'])){
        $id = $_GET['trnimi'];
        $db = openDb();
        selectAsJson($db, "SELECT trnimi FROM tuoteryhma where trnro = $id");

    }


}
catch(PDOException $pdoex){
    returnError($pdoex);
}