<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$new_category = filter_var($input->trnimi,FILTER_SANITIZE_STRING);

try {
    $db = openDb();
    $db->beginTransaction();
    $query = $db->prepare("INSERT INTO tuoteryhma (trnimi) values ((:trnimi))");
    $query->bindValue(':trnimi',$new_category,PDO::PARAM_STR);

    $query->execute();

    header ('HTTP/1.1 200 OK');
    $data = array('trnimi' => $new_category);
    echo json_encode($data);

    $db->commit();
} 

catch (PDOException $pdoex) {
    returnError($pdoex);
}

