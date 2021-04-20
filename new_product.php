<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$new_name = filter_var($input->tuotenimi,FILTER_SANITIZE_STRING);
$new_description = filter_var($input->kuvaus,FILTER_SANITIZE_STRING);
$new_price = filter_var($input->hinta,FILTER_SANITIZE_STRING);
$new_picture = filter_var($input->kuva,FILTER_SANITIZE_STRING);
$trnro = filter_var($input->trnro,FILTER_SANITIZE_STRING);

try {
    $db = openDb();
    $query = $db->prepare("INSERT INTO tuote (tuotenimi,kuvaus,hinta,kuva,trnro) values (:tuotenimi,:kuvaus,:hinta,:kuva,:trnro)");
    $query->bindValue(':tuotenimi',$new_name,PDO::PARAM_STR);
    $query->bindValue(':kuvaus',$new_description,PDO::PARAM_STR);
    $query->bindValue(':hinta',$new_price,PDO::PARAM_STR);
    $query->bindValue(':kuva',$new_picture,PDO::PARAM_STR);
    $query->bindValue(':trnro',$trnro,PDO::PARAM_STR);

    $query->execute();

    header ('HTTP/1.1 200 OK');
    $data = array('tuotenimi' => $new_name,'kuvaus' => $new_description, 'hinta' => $new_price, 'kuva' => $new_picture, 'trnro' => $trnro);
    echo json_encode($data);

} catch (PDOException $pdoex) {
    returnError($pdoex);
}
