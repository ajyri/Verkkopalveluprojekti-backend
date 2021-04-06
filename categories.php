<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

try
{
    if(isset($_GET['trnro'])){
        $id = filter_input(INPUT_GET, 'trnro', FILTER_SANITIZE_STRING);
        $db = openDb();
        selectAsJson($db,"SELECT * FROM tuote where trnro = $id");
    }

    if(isset($_GET['trnimi'])){
        $id = filter_input(INPUT_GET, 'trnimi', FILTER_SANITIZE_STRING);
        $db = openDb();
        selectAsJson($db, "SELECT trnimi FROM tuoteryhma where trnro = $id");

    }

}
catch(PDOException $pdoex){
    returnError($pdoex);
}