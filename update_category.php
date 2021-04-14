<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$trnimi = filter_var($input->trnimi,FILTER_SANITIZE_STRING);
$trnro = filter_var($input->trnro,FILTER_SANITIZE_STRING);

try {
    $db = openDb();
    $query = $db->prepare("UPDATE tuoteryhma SET (trnimi = :trnimi) where (trnro=:trnro)");
    $query->bindValue(':trnimi',$trnimi,PDO::PARAM_STR);
    $query->bindValue(':trnro',$trnro,PDO::PARAM_INT);

    $query->execute();

    header ('HTTP/1.1 200 OK');
    $data = array('trnimi' => $trnimi, 'trnro' => $trnro);
    echo json_encode($data);

} catch (PDOException $pdoex) {
    returnError($pdoex);
}