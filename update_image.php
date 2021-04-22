<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$kuva = filter_var($input->kuva,FILTER_SANITIZE_STRING);
$tuotenro = filter_var($input->tuotenro,FILTER_SANITIZE_STRING);



try {
    $db = openDb();
    $query = $db->prepare("UPDATE tuote SET kuva =:kuva where tuotenro=:tuotenro");
    $query->bindValue(':kuva',$kuva,PDO::PARAM_STR);
    $query->bindValue(':tuotenro',$tuotenro,PDO::PARAM_INT);

    $query->execute();

    header ('HTTP/1.1 200 OK');
    $data = array('kuva' => $kuva, 'tuotenro' => $tuotenro);
    echo json_encode($data);

} catch (PDOException $pdoex) {
    returnError($pdoex);
}