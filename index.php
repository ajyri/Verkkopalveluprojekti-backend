<?php
require_once './inc/functions.php';
require_once './inc/headers.php';


try {
    $db = openDb();
    $sql = "select * from tuote";
    $query = $db->query($sql);
    $results = $query->fetchAll(PDO::FETCH_ASSOC);
    header('HTTP/1.1 200 OK');
    echo json_encode($results);
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}