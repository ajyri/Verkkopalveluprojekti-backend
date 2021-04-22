<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$tuotenimi = filter_var($input->tuotenimi,FILTER_SANITIZE_STRING);
$tuotenro = filter_var($input->tuotenro,FILTER_SANITIZE_STRING);
$kuvaus = filter_var($input->kuvaus,FILTER_SANITIZE_STRING);
$hinta = filter_var($input->hinta,FILTER_SANITIZE_STRING);
$trnro = filter_var($input->trnro,FILTER_SANITIZE_STRING);

try {
    $db = openDb();
    $query = $db->prepare("UPDATE tuote SET tuotenimi =:tuotenimi, kuvaus =:kuvaus, hinta =:hinta, trnro =:trnro where tuotenro=:tuotenro");
    $query->bindValue(':tuotenimi',$tuotenimi,PDO::PARAM_STR);
    $query->bindValue(':trnro',$trnro,PDO::PARAM_STR);
    $query->bindValue(':kuvaus',$kuvaus,PDO::PARAM_STR);
    $query->bindValue(':hinta',$hinta,PDO::PARAM_INT);
    $query->bindValue(':tuotenro',$tuotenro,PDO::PARAM_INT);

    $query->execute();

    header ('HTTP/1.1 200 OK');
    $data = array('tuotenimi' => $tuotenimi, 'tuotenro' => $tuotenro, 'hinta' => $hinta, 'kuvaus' => $kuvaus,'trnro' => $trnro);
    echo json_encode($data);

} catch (PDOException $pdoex) {
    returnError($pdoex);
}