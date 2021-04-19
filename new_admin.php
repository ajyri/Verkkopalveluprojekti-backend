<?php
    $username = 'admin';
    $password = password_hash('admin',PASSWORD_DEFAULT);

    $sql = "INSERT INTO admin_kayttaja (kayttajanimi,salasana) VALUES ('$username', '$password')";
    echo $sql;








