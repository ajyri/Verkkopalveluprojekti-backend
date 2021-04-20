<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$sahkpost = filter_var($input->sahkpost, FILTER_SANITIZE_STRING);

try {
    $db = openDb();
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $query = $db->prepare('insert into uutiskirja(sahkpost) values (:sahkpost)');
    $query->bindValue(':sahkpost',$sahkpost,PDO::PARAM_STR);
    $query->execute();

    echo header('HTTP/1.1 200 OK');
    $data = array(/* 'address' => $db -> lastInsertId(), */ 'sahkpost' => $sahkpost);
    echo json_encode($data);
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}