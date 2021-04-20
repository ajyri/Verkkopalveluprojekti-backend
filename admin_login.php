<?php
    require_once './inc/functions.php';
    require_once './inc/headers.php';

    $username = filter_input(INPUT_POST,'kayttajanimi',FILTER_SANITIZE_STRING);
    $password = filter_input(INPUT_POST,'salasana',FILTER_SANITIZE_STRING);

    $sql = "SELECT * FROM admin_kayttaja WHERE kayttajanimi = '$username'";

    try {
        $db = openDb();
        $query = $db->query($sql);
        $user = $query->fetch(PDO::FETCH_OBJ);
        if ($user) {
            $passwordfromdb = $user->salasana;
            if (password_verify($password,$passwordfromdb)) {
                header("HTTP/1.1 200 OK");
                $data = array( 
                    'id' => $user-> kayttajaId
                );
                $_SESSION['user'] = $user;
            } else {
                header("HTTP/1.1 401 Unauthorized");
                $data = array("message"=>"Epäonnistunut kirjautuminen");
            }
        } else {
            header("HTTP/1.1 401 Unauthorized");
            $data = array("message"=>"Epäonnistunut kirjautuminen");
        }
        echo json_encode($data);

    } catch (PDOException $pdoex) {
        returnAdminError($pdoex);
        exit;
    }