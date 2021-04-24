<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

try{
    $tilausnro = filter_input(INPUT_GET, 'tilausnro', FILTER_SANITIZE_STRING);
    $db = openDb();
    $query = $db->prepare("SELECT asnimi, aspuh, lisatiedot, tilaus.tilausnro, tilauspvm, kpl, rivinro, tilausrivi.tuotenro, (hinta * kpl) AS hinta, tuotenimi from tilausrivi, tilaus, tuote where tilausrivi.tilausnro = :tilausnro AND tilaus.tilausnro = tilausrivi.tilausnro AND tilausrivi.tuotenro = tuote.tuotenro ORDER BY rivinro");
    $query->bindValue(':tilausnro',$tilausnro,PDO::PARAM_INT);
    $query->execute();
    header('HTTP/1.1 200 OK');
    $results = $query->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($results);

   
    
}catch(PDOException $e){
    returnError($pdoex);
}