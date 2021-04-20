<?php
require_once './inc/functions.php';
require_once './inc/headers.php';

try {

  $input = json_decode(file_get_contents('php://input'), true);
  $asnimi = filter_var($input["asiakas"], FILTER_SANITIZE_STRING);
  $aspuh = filter_var($input["aspuh"], FILTER_SANITIZE_NUMBER_INT);
  $tiedot = filter_var($input["tiedot"], FILTER_SANITIZE_STRING);
  $tuotenro = (array)$input["tuotenro"];
  $kpl = (array)$input["kpl"];
  $rivinro = 1;

  $db = openDb();
  $db->beginTransaction();
  $query = $db->prepare("INSERT INTO TILAUS(asnimi, aspuh, lisatiedot) values (:asnimi, :aspuh, :tiedot) ");
  $query->bindValue(':asnimi', $asnimi, PDO::PARAM_STR);
  $query->bindValue(':aspuh', $aspuh, PDO::PARAM_STR);
  $query->bindValue(':tiedot', $tiedot, PDO::PARAM_STR);
  $query->execute();

  $id = $db->lastInsertId();

  for($i = 0; $i < count($tuotenro); $i++){
  $query = $db->prepare("INSERT INTO TILAUSRIVI values (:tilausnro, :rivinro, :tuotenro, :kpl)");
  $query->bindValue(':tuotenro', $tuotenro[$i], PDO::PARAM_INT);
  $query->bindValue(':tilausnro', $id, PDO::PARAM_INT);
  $query->bindValue(':rivinro', $rivinro, PDO::PARAM_INT);
  $query->bindValue(':kpl', $kpl[$i], PDO::PARAM_INT);
  $query->execute();
  $rivinro++;
}
$db->commit();

} catch (PDOException $e) {
  $db->rollback();
  echo"Connection failed: ". $e->getMessage();
}
