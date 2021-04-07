<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

try
{

        $id = filter_input(INPUT_GET, 'trnro', FILTER_SANITIZE_STRING);
        $db = openDb();
        selectAsJson($db,"SELECT * FROM tuote where trnro = $id");

}
catch(PDOException $pdoex){
    returnError($pdoex);
}